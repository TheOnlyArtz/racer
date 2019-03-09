# This manager will handle all of Racer's websocket
# traffic including rooms and players
class ws_manager
  def initialize()
    @rooms = {} of String => Player
    @global_players = {} of String => Player
  end
end
