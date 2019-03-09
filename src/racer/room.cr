class Room
  getter members

  def initialize(@ws_manager : WS_manager, @members : Hash(String, Player))
  end
end
