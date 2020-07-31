#!/usr/bin/env ruby
# Game Pseudocode
# 1.Create board
# 2.Get user input from players
# 3.Track players and turns
# 4.Check if board is full
# 5.check for valid move
# 6.check positions for each player
# 7.check for winner, loser and draw
# 8. display output
#

class Board
  attr_reader :board

  def initialize
    reset_board
  end

  def reset_board
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def display_board
    puts '-------------'
    puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
    puts '-------------'
    puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
    puts '-------------'
    puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
    puts '-------------'
  end

end

class Player
  PLAYER_ONE_TAG = 'X'
  PLAYER_TWO_TAG = 'O'
  
  @@play_counter = 0

  def initialize(gameBoard)
    @@gameBoard = gameBoard
  end
  
  def current_player()
    return @@play_counter % 2 == 0 ? @@player_one : @@player_two
  end
  
  def is_valid_move(index)
    return @@gameBoard.board[index - 1] != index.between?(1, 9) && @@gameBoard.board[index - 1] != "X" && @@gameBoard.board[index - 1] != "O"
  end

  def insert_into_board(input)
    @@gameBoard.board[input - 1] = @@play_counter % 2 == 0 ? PLAYER_ONE_TAG : PLAYER_TWO_TAG
    @@play_counter += 1
  end
  
  def start_game
    puts "Enter first player's Name"
    @@player_one = gets.chomp
    puts "Enter second player's Name"
    @@player_two = gets.chomp
    puts "#{@@player_one} you are #{PLAYER_ONE_TAG} \n#{@@player_two} you are #{PLAYER_TWO_TAG}"
  end
  
  def player_selection
    puts "It's the #{current_player}'s turn, Please Choose a number between 1 - 9 "
    input = gets.chomp.to_i
      
    while input.between?(1, 9) == false
      puts 'Invalid! Please choose a number between 1 - 9'
       input = gets.chomp.to_i
    end
    
    if is_valid_move(input)
    	insert_into_board(input)
    

    else
      puts "Invalid move, try again."
      player_selection
    end

    @@gameBoard.display_board

    check = (@@gameBoard.board.values_at(0, 1, 2).all?("X") || @@gameBoard.board.values_at(0, 1, 2).all?("O") || @@gameBoard.board.values_at(3, 4, 5).all?("X") || @@gameBoard.board.values_at(3, 4, 5).all?("O") || @@gameBoard.board.values_at(6, 7, 8).all?("X") || @@gameBoard.board.values_at(6, 7, 8).all?("O") || @@gameBoard.board.values_at(0, 3, 6).all?("X") || @@gameBoard.board.values_at(0, 3, 6).all?("O") || @@gameBoard.board.values_at(1, 4, 7).all?("X") || @@gameBoard.board.values_at(1, 4, 7).all?("O") || @@gameBoard.board.values_at(2, 5, 8).all?("X") || @@gameBoard.board.values_at(2, 5, 8).all?("O") || @@gameBoard.board.values_at(0, 4, 8).all?("X") || @@gameBoard.board.values_at(0, 4, 8).all?("O") || @@gameBoard.board.values_at(2, 4, 8).all?("X") || @@gameBoard.board.values_at(2, 4, 8).all?("O"))
    if ( !check )
      player_selection
    elsif check
      puts "We have a winner"
    elsif ( !check && @@gameBoard.board.any? { |e| e.is_a?(Integer)} )
      player_selection
    else
      puts "Its a draw"
    end
  end
end
  
 

board1 = Board.new
player = Player.new(board1)
player.start_game
player.player_selection



