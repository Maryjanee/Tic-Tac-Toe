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

  def start_game
    puts "Enter first player's Name"
    player_one = gets.chomp
    puts "Enter second player's Name"
    player_two = gets.chomp
    puts "#{player_one} you are X \n#{player_two} you are O"
    @player_count = 0
  end

  def player_selection(player)
    puts "It's the #{player}'s turn, Please Choose a number between 1 - 9 "
    input = gets.chomp
    selection = input.to_i
    if input != selection.to_s 
      puts "this is not a number" 
      player_selection
    end
    
    sentinel = true
    while sentinel
      if selection.is_a?(Integer) == false || selection.between?(1, 9) == false 
        puts 'Please choose a number between 1 - 9'
        selection = gets.to_i
       elsif selection.between?(1, 9) == true 
        sentinel = false
        puts "Your selection has been placed on the board"
        @player_count += 1
      end
    end
  end
end

board1 = Board.new
puts board1.display_board
puts board1.user_input
puts board1.player_selection
