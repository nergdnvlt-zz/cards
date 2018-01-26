require './card_lib/card.rb'

class Guess
  attr_reader :card,
              :response

  def initialize(response, trivia_card)
    @card       = trivia_card
    @response   = response

  end

  def correct?
    if @response == card.answer
      return true
    else
      return false
    end
  end

  def feedback
    if @response == card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end

end
