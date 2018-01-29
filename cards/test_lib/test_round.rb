require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

require './card_lib/card.rb'
require './card_lib/guess.rb'
require './card_lib/deck.rb'
require './card_lib/round.rb'

class CardTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([@card_1, @card_2])
  end

  def test_if_round_exists
    round = Round.new(@deck)
    assert_instance_of Round, round
  end

  def test_deck_method_in_round
    round = Round.new(@deck)
    assert_instance_of Deck, round.deck
  end

  def test_round_guess_empty
    round = Round.new(@deck)
    assert_equal [], round.guesses
  end

  def test_rounds_current_card
    round = Round.new(@deck)
    assert_equal @card_1, round.current_card
  end

  def test_it_records_guess
    round = Round.new(@deck)
    result = round.record_guess("Juneau")
    assert_instance_of Guess, result
  end

  def test_round_increments
    round = Round.new(@deck)
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end

  def test_feedback_response
  round = Round.new(@deck)
  round.record_guess("Juneau")
  assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_number_correct
    round = Round.new(@deck)
    round.record_guess("Juneau")
    assert_equal 1, round.number_correct
    assert_instance_of Card, round.current_card
    assert_instance_of Guess, round.record_guess("2")
    assert_equal 2, round.guesses.count
    assert_equal "Incorrect.", round.guesses.last.feedback
    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end

end
