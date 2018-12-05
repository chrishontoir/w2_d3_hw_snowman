require('minitest/autorun')
require('minitest/rg')
require_relative('../hidden_word')

class HiddenWordTest < MiniTest::Test

  def setup
    @hidden_word = HiddenWord.new("CodeClan")
  end

  def test_return_hidden_word
    assert_equal("CodeClan", @hidden_word.answer)
  end

  def test_return__false
    assert_equal(false, @hidden_word.check_guess("b"))
  end

  def test_return__true
    assert_equal(true, @hidden_word.check_guess("a"))
  end

  def test_answer_count
    assert_equal(8, @hidden_word.answer_length)
  end

  def test_replace_with_stars
    assert_equal("********", @hidden_word.replace_with_stars(@hidden_word.answer))
  end

  def test_replace_with_guessed_letters
    assert_equal("c***c*a*", @hidden_word.replace_with_guessed_letters("codeclan", ["a", "b", "c"]))
  end
end
