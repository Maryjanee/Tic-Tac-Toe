#!/usr/bin/env ruby
class Board
    attr_accessor:board

    @board = Array.new(9, " ")
    def initialize
        @board = board
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
end
board1 = Board.new(board)
puts board1