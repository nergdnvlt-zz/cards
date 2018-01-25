class Card
  attr_reader :question,
              :answer

  def initialize(question = "", answer = "")
    @question = question
    @answer   = answer
  end

end


card1 = Card.new("What is the capital of Alaska?", "Juneau")
