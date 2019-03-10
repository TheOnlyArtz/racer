# A file to host all of the route# A file to host all of the routes
require "json"
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
     payload = {"room_id" => new_id}
     @ws_manager.assign_room new_id, room

     ctx.response.print payload.to_json
    end

    # post "/register_player" do |ctx|
    #   new_id = Router::Helper.generate_user_id
    #   player = Router::Helper.construct_player_payload @ws_manager, new_id
    #   @ws_manager.assign_player new_id, player
    # end
  end

  def set_sockets
    ws "/room/:id" do |socket, ctx|
      room_id = ctx.params.url["id"]
      curr_players_in_room = @ws_manager.@rooms[room_id].@members
      payload_new_player = {"op" => "players_amount", "data" => {"amount" => curr_players_in_room.size + 1}}

      if @ws_manager.rooms.has_key?(room_id)
        # Get the new client to the global connections list
        @ws_manager.@connections << socket
        # Get the new client to the room's connections list
        curr_players_in_room << socket

        # Broadcast new player amount live!
        Router::Helper.broadcast payload_new_player, curr_players_in_room

      else
        socket.close
      end

      socket.on_close do
        # Delete socket from room and global list
        @ws_manager.@connections.delete socket
        curr_players_in_room.delete socket

        # If the room is empty delete it
        if @ws_manager.@connections.size.zero?
          @ws_manager.@rooms.delete room_id
        else
          # Broadcast new player count
          payload_lose_player = {"op" => "players_amount", "data" => {"amount" => curr_players_in_room.size }}
          # Update player amount live!
          Router::Helper.broadcast payload_lose_player, curr_players_in_room
        end
      end
    end
  end
end
