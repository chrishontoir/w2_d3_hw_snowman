require('minitest/autorun')
require('minitest/rg')
require_relative('../player')

class PlayerTest < MiniTest::Test

  def setup
    @player = Player.new("Stephen", 6)
  end

  def test_player_name
    assert_equal("Stephen", @player.player_name)
  end

  def test_player_lives
    assert_equal(6, @player.player_lives)
  end

  def test_remove_life
    @player.remove_life
    assert_equal(5, @player.player_lives)
  end

end
