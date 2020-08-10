# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
class Player
  attr_reader :player_one_tag, :player_one
  attr_reader :player_two_tag, :player_two

  def initialize(gameboard, player_one, player_two)
    @gameboard = gameboard
    @player_one = player_one
    @player_one_tag = '✘'
    @player_two = player_two
    @player_two_tag = '◯'
    @play_counter = 0
  end

  def current_player
    @play_counter.even? ? @player_one : @player_two
  end

  def valid_move(index)
    @gameboard[index - 1] != index.between?(1, 9) && @gameboard[index - 1] != '✘' && @gameboard[index - 1] != '◯'
  end

  def insert_into_board(input)
    @gameboard[input - 1] = @play_counter.even? ? @player_one_tag : @player_two_tag
    @play_counter += 1
  end

  def winner_checker(gameboard)
    (gameboard.values_at(0, 1, 2).all?('✘') || gameboard.values_at(0, 1, 2).all?('◯') || gameboard.values_at(3, 4, 5).all?('✘') || gameboard.values_at(3, 4, 5).all?('◯') || gameboard.values_at(6, 7, 8).all?('✘') || gameboard.values_at(6, 7, 8).all?('◯') || gameboard.values_at(0, 3, 6).all?('✘') || gameboard.values_at(0, 3, 6).all?('◯') || gameboard.values_at(1, 4, 7).all?('✘') || gameboard.values_at(1, 4, 7).all?('◯') || gameboard.values_at(2, 5, 8).all?('✘') || gameboard.values_at(2, 5, 8).all?('◯') || gameboard.values_at(0, 4, 8).all?('✘') || gameboard.values_at(0, 4, 8).all?('◯') || gameboard.values_at(2, 4, 8).all?('✘') || gameboard.values_at(2, 4, 8).all?('◯'))
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
