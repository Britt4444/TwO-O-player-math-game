require_relative 'player'
require_relative 'question'

# Create a 2-Player math game where players take turns to answer simple math addition problems.
# A new math question is generated for each turn by picking two numbers between 1 and 20. 
# The player whose turn it is is prompted the question and must answer correctly or lose a life.

class Game

  attr_reader :player_one, :player_two
  
  def initialize
    puts "Player 1, please enter your name: "
    player_one = gets.chomp
    @player_one = Player.new(player_one)
    puts "Player 2, please enter your name: "
    player_two = gets.chomp
    @player_two = Player.new(player_two)
  end

  def new_question
    @new_question = Question.new
    puts "---- NEW TURN ----"
    if @player_one.current_player 
      puts "#{@player_one.name}: #{@new_question.question}"
    else
      puts "#{@player_two.name}: #{@new_question.question}"
    end
  end

  def check_answer
    # check that input matches answer, chomp not necessary with to_i, anything after integer is ignored
    if gets.to_i == @new_question.answer
      if @player_one.current_player
        puts "Correct, #{@player_one.name}! The answer is #{@new_question.answer}"
        # logic to switch current player
        @player_one.current_player = false
        @player_two.current_player = true
        # game data output
        puts "#{@player_one.name}: #{@player_one.lives}/3 vs #{@player_two.name}: #{@player_two.lives}/3"
        check_lives
      else
        puts "Correct, #{@player_two.name}! The answer is #{@new_question.answer}"
        @player_two.current_player = false
        @player_one.current_player = true
        puts "#{@player_one.name}: #{@player_one.lives}/3 vs #{@player_two.name}: #{@player_two.lives}/3"
        check_lives
      end
    else
      if @player_one.current_player
        # call lose life method to decrease lives by 1
        @player_one.lose_life
        puts "Incorrect, #{@player_one.name}. You lose 1 life! The answer is #{@new_question.answer}"
        @player_one.current_player = false
        @player_two.current_player = true
        puts "#{@player_one.name}: #{@player_one.lives}/3 vs #{@player_two.name}: #{@player_two.lives}/3"
        check_lives
      else
        @player_two.lose_life
        puts "Incorrect, #{@player_two.name}. You lose 1 life! The answer is #{@new_question.answer}"
        @player_two.current_player = false
        @player_one.current_player = true
        puts "#{@player_one.name}: #{@player_one.lives}/3 vs #{@player_two.name}: #{@player_two.lives}/3"
        check_lives
      end
    end
  end

  def check_lives
    if @player_one.lives == 0
      puts "---- GAME OVER ----"
      puts "Sorry #{@player_one.name}, #{@player_two.name} wins with #{@player_two.lives}/3 lives remaining!"
      puts "That sums up the game, thanks for playing!"
    elsif @player_two.lives == 0
      puts "---- GAME OVER ----"
      puts "Sorry #{@player_two.name}, #{@player_one.name} wins with #{@player_one.lives}/3 lives remaining!"
      puts "That sums up the game, thanks for playing!"
    else
      run_game
    end
  end

  def run_game
    new_question
    check_answer
  end

end