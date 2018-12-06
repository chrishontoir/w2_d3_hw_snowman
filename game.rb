class Game
  attr_accessor :player, :hidden_word, :guessed_letters

  def initialize(player, hidden_word, guessed_letters)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = guessed_letters
  end

  def get_input_from_player
    @input = gets.chomp
    return @input
  end

  def guessed_letters_length
    return @guessed_letters.length
  end

  def compare_input_with_array(guess)
    if @guessed_letters.include?(guess)
      return true
    else
      # p "You guessed #{guess}."
      @guessed_letters.push(guess.downcase!)
    end
  end

  def gives_user_input_to_hidden_word
    @hidden_word.replace_with_guessed_letters(@hidden_word.answer, @game.guessed_letters)
  end

end
