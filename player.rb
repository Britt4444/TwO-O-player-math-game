class Player
  attr_accessor :lives, :current_player
  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 3
    @current_player = true
  end

  def lose_life
    @lives -= 1
  end

end