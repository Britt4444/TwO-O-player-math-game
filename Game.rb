class Game

  def initialize
    @players = []
    puts "Player 1, please enter your name: "
    player_one = gets.chomp
    @players << Player.new(player_one)
    puts "Player 2, please enter your name: "
    player_two = gets.chomp
    @players << Player.new(player_two)
    @current_player = @players.first()
  end

  def 

end