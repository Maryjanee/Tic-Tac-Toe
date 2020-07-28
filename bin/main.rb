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

  def user_input
    puts "Enter first player's Name"
    player_one = gets.chomp
    puts "Enter second player's Name"
    player_two = gets.chomp
    puts "#{player_one} you are X \n#{player_two} you are O"
  end

  def player_selection
    puts 'The Game has begun, make your selection'
    while (selection = gets.chomp.to_i)
      if selection.between?(0, 9) != true
        puts 'Please choose a number between 1 - 9'
      else
        puts 'weldone'
        break
      end
    end
  end
end

board1 = Board.new
puts board1.display_board
puts board1.user_input
puts board1.player_selection
