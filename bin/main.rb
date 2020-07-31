#!/usr/bin/env ruby

require './lib/Player.rb'
require './lib/Board.rb'

def display_board(board)
  puts '-------------'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '-------------'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '-------------'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts '-------------'
end

def player_selection(game_board, player)
  puts "It's the #{player.current_player}'s turn, Please Choose a number between 1 - 9 "
  input = gets.chomp.to_i
    
  while input.between?(1, 9) == false
    puts 'Invalid! Please choose a number between 1 - 9'
     input = gets.chomp.to_i
  end
  
  if player.is_valid_move(input)
    player.insert_into_board(input)
  else
    puts "Invalid move, try again."
    player_selection(game_board, player)
  end

  display_board(game_board.board)

  check = (game_board.board.values_at(0, 1, 2).all?("X") || game_board.board.values_at(0, 1, 2).all?("O") || game_board.board.values_at(3, 4, 5).all?("X") || game_board.board.values_at(3, 4, 5).all?("O") || game_board.board.values_at(6, 7, 8).all?("X") || game_board.board.values_at(6, 7, 8).all?("O") || game_board.board.values_at(0, 3, 6).all?("X") || game_board.board.values_at(0, 3, 6).all?("O") || game_board.board.values_at(1, 4, 7).all?("X") || game_board.board.values_at(1, 4, 7).all?("O") || game_board.board.values_at(2, 5, 8).all?("X") || game_board.board.values_at(2, 5, 8).all?("O") || game_board.board.values_at(0, 4, 8).all?("X") || game_board.board.values_at(0, 4, 8).all?("O") || game_board.board.values_at(2, 4, 8).all?("X") || game_board.board.values_at(2, 4, 8).all?("O"))
  if check
    x_count = game_board.board.count{|x| x == "X"}
    o_count = game_board.board.count{|x| x == "O"}
    if(x_count > o_count) 
      puts "#{player.player_one} is the winner"
    else 
      puts "#{player.player_two} is the winner"
    end
    elsif ( !check && game_board.board.any? { |e| e.is_a?(Integer)} )
      player_selection(game_board, player)
    else
      puts "Its a draw"
    end
  end

def start_game
  game_board = Board.new
  display_board(game_board.board)

  puts "Enter first player's Name"
  player_one = gets.chomp
  puts "Enter second player's Name"
  player_two = gets.chomp

  player = Player.new(game_board, player_one, player_two)

  puts "#{player_one} you are #{player.player_one_tag} \n#{player_two} you are #{player.player_two_tag}"

  player_selection(game_board, player)
end

start_game



