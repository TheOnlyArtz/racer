# A file to host all of the route# A file to host all of the routes

class Router
  def initialize(@ws_manager : WS_manager)
  end

  # GET Routes
  def set_gets
    get "/" do |ctx|
      render "src/views/index.ecr"
    end

    get "/room/:id" do |ctx|
      room_id = ctx.params.url["id"]
      if @ws_manager.rooms.has_key?(room_id)
        render "src/views/room.ecr"
      else
        ctx.response.status_code = 404
      end
    end
  end

  # POST routes
  def set_posts
    post "/create_room" do |ctx|
     new_id = Router::Helper.generate_user_id
     room = Room.new(@ws_manager, new_id)
     @ws_manager.assign_room new_id, room

     ctx.response.print "{\"room_id\": \"#{new_id}\"}"
    end

    post "/register_player" do |ctx|
      new_id = Router::Helper.generate_user_id
      player = Router::Helper.construct_player_payload @ws_manager, new_id
      @ws_manager.assign_player new_id, player
    end
  end

  def set_sockets
    ws "/room/:id" do |socket, ctx|
      room_id = ctx.params.url["id"]
      puts "socket coming in"
      if @ws_manager.rooms.has_key?(room_id)
        @ws_manager.@connections << socket
      else
        socket.close
      end

      socket.on_close do
        @ws_manager.@connections.delete socket

        if @ws_manager.@connections.size.zero?
          @ws_manager.@rooms.delete room_id
        end
      end
    end
  end
end
