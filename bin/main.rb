#!/usr/bin/env ruby
=begin
Game Pseudocode
1.Create board
2.Get user input from players
3.Track players and turns
4.Check if board is full
5.check for valid move
6.check positions for each player
7.check for winner, loser and draw
8. display output

=end

class Board
    attr_reader:board
    
    def initialize
      reset_board
    end
    
    def reset_board
      @board = Array.new(9, " ")
    
    end
    
    def display_board
        puts "-------------"
        puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
        puts "-------------"
        puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
        puts "-------------"
        puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
        puts "-------------"   
    end
    
    def get_user_input
      puts "Enter first player's Name"
      player_one = gets.chomp
      puts "Enter second player's Name"
      player_two = gets.chomp
      puts "#{player_one} you are X \n#{player_two} you are O"
    end
end

board1 = Board.new()
puts board1.display_board
puts board1.get_user_input
