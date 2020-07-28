#!/usr/bin/env ruby
=begin
Game Pseudocode
1.Create board
2.Get user input 
3.Track players and turns
4.Check if board is full
=end

class Board
    attr_reader:board
    @@player_1
    @@player_2
    
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
      puts
    end
end
board1 = Board.new()
puts board1.display_board
