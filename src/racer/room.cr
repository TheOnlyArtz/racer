class Room
  getter members

  def initialize(@ws_manager : WS_manager, @id : String)
    @members = {} of String => Player
  end
end
