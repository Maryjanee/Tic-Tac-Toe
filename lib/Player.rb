class Player
  attr_reader :player_one_tag, :player_one
  attr_reader :player_two_tag, :player_two
  @@play_counter = 0

  def initialize(gameBoard, player_one, player_two)
    @gameBoard = gameBoard
    @player_one = player_one
    @player_one_tag = 'X'
    @player_two = player_two
    @player_two_tag = 'O'
  end
  
  def current_player
    return @@play_counter % 2 == 0 ? @player_one : @player_two
  end
  
  def is_valid_move(index)
    return @gameBoard.board[index - 1] != index.between?(1, 9) && @gameBoard.board[index - 1] != "X" && @gameBoard.board[index - 1] != "O"
  end

  def insert_into_board(input)
    @gameBoard.board[input - 1] = @@play_counter % 2 == 0 ? @player_one_tag : @player_two_tag
    @@play_counter += 1
  end
end