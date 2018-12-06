require_relative('./game')
require_relative('./hidden_word')
require_relative('./player')



p "Enter a word/phrase:"
word_to_guess = gets.chomp
@hidden_word = HiddenWord.new(word_to_guess)
system "clear"

p "Enter your name:"
player_name = gets.chomp
@new_player = Player.new(player_name, 6)
guessed_letter = ""

p "Hi #{@new_player.player_name.upcase}, you have #{@new_player.player_lives} lives remaining. "

@game = Game.new(@new_player, @hidden_word,[" "])


@hidden_word.replace_with_guessed_letters(@hidden_word.answer, @game.guessed_letters)

while @new_player.player_lives > 0
  p "Guess a letter:"
  guessed_letter = gets.chomp

  if @game.compare_input_with_array(guessed_letter) == true
    p "You've already guessed that letter."
  else
    if @hidden_word.answer.include?(guessed_letter)
      p "Correct! You still have #{@new_player.player_lives} lives remaining."
    else
      @new_player.remove_life
      p "Incorrect! #{@new_player.player_lives} lives remaining."
    end
  end

  @game.compare_input_with_array(guessed_letter)
  @hidden_word.replace_with_guessed_letters(@hidden_word.answer, @game.guessed_letters)
end

if @new_player.player_lives == 0
  p "No lives remaining. Game over!"
end

if @hidden_word.all_correct(@hidden_word.answer, @game.guessed_letters) == true
  p "You guessed the word correctly! Well done!"
end
