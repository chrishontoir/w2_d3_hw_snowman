require('minitest/autorun')
require('minitest/rg')
require_relative('../game')
require_relative('../hidden_word')
require_relative('../player')
require('pry')

class GameTest < MiniTest::Test
  def setup
    @player = Player.new("Conor", 6)
    @hidden_word = HiddenWord.new("codeclan") #downcase to follow...
    @game = Game.new(@player, @hidden_word,["a"])
  end

  def test_get_player
    assert_equal(@player, @game.player)
  end

  def test_get_hidden_word
    assert_equal(@hidden_word, @game.hidden_word)
  end

  def test_get_guessed_letters
    assert_equal(["a"], @game.guessed_letters)
  end

  # def test_get_input_from_player
  #   assert_equal("a", @game.get_input_from_player)
  # end

  def test_compare_input_with_array__already_exists
    @game.compare_input_with_array("a") #@input
    assert_equal(1, @game.guessed_letters_length)
  end

  def test_compare_input_with_array__doesnt_exist
    @game.compare_input_with_array("b")
    assert_equal(2, @game.guessed_letters_length)
  end

  def test_gives_user_input_to_hidden_word
    assert_equal("******a*", @hidden_word.replace_with_guessed_letters(@hidden_word.answer, @game.guessed_letters))
  end



end
