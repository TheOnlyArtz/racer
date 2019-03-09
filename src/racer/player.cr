class Player
  getter id : String
  getter avgWPM : Float64
  getter wins : Int32

  def initialize(@ws_manager : WS_manager, id : String, avgWPM : Float64, wins : Int32)
      @id = id
      @avgWPM = avgWPM
      @wins = avgWPM
  end
end
