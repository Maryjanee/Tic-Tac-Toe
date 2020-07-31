# rubocop:disable Layout/LineLength
class Player
  attr_reader :player_one_tag, :player_one
  attr_reader :player_two_tag, :player_two

  def initialize(gameboard, player_one, player_two)
    @gameboard = gameboard
    @player_one = player_one
    @player_one_tag = 'X'
    @player_two = player_two
    @player_two_tag = 'O'
    @play_counter = 0
  end

  def current_player
    @play_counter.even? ? @player_one : @player_two
  end

  def valid_move(index)
    @gameboard.board[index - 1] != index.between?(1, 9) && @gameboard.board[index - 1] != 'X' && @gameboard.board[index - 1] != 'O'
  end

  def insert_into_board(input)
    @gameboard.board[input - 1] = @play_counter.even? ? @player_one_tag : @player_two_tag
    @play_counter += 1
  end
end

# rubocop:enable Layout/LineLength
