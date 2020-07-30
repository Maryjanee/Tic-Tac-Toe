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
    @board = Array.new(9, ' ')
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
    return @@gameBoard.board[index - 1] == ' ' ? true : false
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
    
    if @@gameBoard.board.any? { |e| e == ' ' } 
      player_selection
    end
  end
end
  
 

board1 = Board.new
player = Player.new(board1)
player.start_game
player.player_selection



