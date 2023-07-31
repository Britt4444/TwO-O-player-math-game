class Question
  attr_reader :question, :answer

  def initialize
    num_one = rand(1...20)
    num_two = rand(1...20)
    @question = "What is the sum of #{num_one} and #{num_two}?"
    @answer = num_one + num_two
  end 

end
