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
  def set_post
    post "/create_room" do |ctx|
      if body = ctx.request.body
         json = Hash(String, String).from_json body
         if json.has_key?("owner_id")
           room = Room.new
         end
      end
    end
  end
end
