require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './card_lib/guess.rb'
require './card_lib/card.rb'

class CardTest < Minitest::Test

  #test if card exists
  # def test_if_calling_card_class_works
  #   card = Card.new("Capital Question", "Capital answer")
  #   assert_instance_of Card, card
  # end

  #test if guess class exists
  def test_guess_class
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
    guess.card
  end

  def test_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Juneau", guess.response
  end

  def test_answer_correct?
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert guess.correct?
  end

  def test_answer_feedback_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_guess_class_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_instance_of Guess, guess
    guess.card
  end
end
