class Player
  @name : String
  @avgWPM : Float64
  @wins : Int32

  getter name
  getter avgWPM
  getter wins

  def initialize(properties : Hash(String, Int32 | String | Float64))
      @name = properties["name"]
      @avgWPM = properties["avgWPM"]
      @wins = properties["wins"]
  end
end
