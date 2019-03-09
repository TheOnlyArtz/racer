class Player
  @id : String
  @avgWPM : Float64
  @wins : Int32

  getter id
  getter avgWPM
  getter wins

  def initialize(@properties : Hash(String, Int32 | String | Float64))
      @name = properties["id"]
      @avgWPM = properties["avgWPM"]
      @wins = properties["wins"]
  end
end
