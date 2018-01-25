require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require './card_lib/card.rb'

class CardTest < Minitest::Test

  #test if card exists
  def test_card_exists
    card = Card.new("Capital Question", "Capital answer")
    assert_instance_of Card, card
  end

  #test it has a question attribute
  def test_card_has_question
    card = Card.new("Capital Question", "Capital answer")
    assert card.question
  end

  #test it has an answer attribute
  def test_card_has_answer
    card = Card.new("Capital Question", "Capital answer")
    assert card.answer
  end

  #test if question accesses properly
  def test_question_is_correct
    card = Card.new("What is the capital of Alaska?", "Capital Answer")
    assert_equal "What is the capital of Alaska?", card.question
  end

  #test answer accesses properly
  def test_answer_is_correct
    card = Card.new("Question", "Juneau")
    assert_equal "Juneau", card.answer
  end

end
