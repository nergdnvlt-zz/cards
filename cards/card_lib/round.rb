require './card_lib/guess.rb'
class Round

  attr_reader :deck,
              :guesses,
              :card_count,
              :user_guess,
              :number_correct,
              :record_guess,
              :percent_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @card_count = 0
    @user_guess = []
    @number_correct = 0
  end

  def guesses
    @guesses
  end

  def current_card
    deck.cards[@card_count]
  end

  def record_guess(guess)
    guess = Guess.new(guess, current_card)
    guesses << guess
    @user_guess << guess.correct?
    @card_count += 1
    @number_correct += 1 if guess.correct?
    guess
  end

  def percent_correct
    (@number_correct.to_f / @guesses.length * 100).round
  end



end
