class Player
  getter id : String
  getter avgWPM : Float64
  getter wins : Int32
  
  def initialize(@ws_manager : WS_manager, properties : Hash(String, Int32 | String | Float64))
      @id = properties["id"]
      @avgWPM = properties["avgWPM"]
      @wins = properties["wins"]
  end
end
