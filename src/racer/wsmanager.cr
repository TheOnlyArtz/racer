# This manager will handle all of Racer's websocket
# traffic including rooms and players

macro assign(name, key, hash, value)
  def {{name}}({{key}}, {{value}})
    @{{hash}}[{{key}}] = {{value}}
  end
end

class WS_manager
  getter rooms
  getter global_players

  def initialize()
    @rooms = {} of String => Player
    @global_players = {} of String => Player
  end

  assign(assign_room, key, rooms, value)

  assign(assign_player, key, global_players, value)

end
