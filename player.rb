class Player

  attr_accessor :player_name, :player_lives

  def initialize(player_name, player_lives)
    @player_name = player_name
    @player_lives = player_lives
  end

  def remove_life
    @player_lives -= 1
  end

end
