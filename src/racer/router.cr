# A file to host all of the route# A file to host all of the routes

class Router
  def initialize(@ws_manager : WS_manager)
  end

  # GET Routes
  def set_gets
    get "/" do |ctx|
      render "src/views/index.ecr"
    end
  end

  # POST routes
  def set_posts
    post "/create_room" do |ctx|
      if body = ctx.request.body
         json = Hash(String, String).from_json body
         if json.has_key?("owner_id")
           
           # Essentially this payload would exist inside the request body
           # This is for the sake of testing
           players_playload = {
             json["owner_id"] => Player.new(self.@ws_manager, json["owner_id"], 0, 0)
           }

           room = Room.new(self.@ws_manager, players_playload)
         end
      end
    end
  end
end
