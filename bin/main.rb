#!/usr/bin/env ruby
# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
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

def player_selection(gameboard, player)
  puts "It's the #{player.current_player}'s turn, Please Choose a number between 1 - 9 "
  input = gets.chomp.to_i

  while input.between?(1, 9) == false
    puts 'Invalid! Please choose a number between 1 - 9'
    input = gets.chomp.to_i
  end

  if player.valid_move(input)
    player.insert_into_board(input)
  else
    puts 'Invalid move, try again.'
    player_selection(gameboard, player)
  end

  display_board(gameboard.board)

  check = (gameboard.board.values_at(0, 1, 2).all?('X') || gameboard.board.values_at(0, 1, 2).all?('O') || gameboard.board.values_at(3, 4, 5).all?('X') || gameboard.board.values_at(3, 4, 5).all?('O') || gameboard.board.values_at(6, 7, 8).all?('X') || gameboard.board.values_at(6, 7, 8).all?('O') || gameboard.board.values_at(0, 3, 6).all?('X') || gameboard.board.values_at(0, 3, 6).all?('O') || gameboard.board.values_at(1, 4, 7).all?('X') || gameboard.board.values_at(1, 4, 7).all?('O') || gameboard.board.values_at(2, 5, 8).all?('X') || gameboard.board.values_at(2, 5, 8).all?('O') || gameboard.board.values_at(0, 4, 8).all?('X') || gameboard.board.values_at(0, 4, 8).all?('O') || gameboard.board.values_at(2, 4, 8).all?('X') || gameboard.board.values_at(2, 4, 8).all?('O'))
  if check
    x_count = gameboard.board.count { |x| x == 'X' }
    o_count = gameboard.board.count { |x| x == 'O' }
    if x_count > o_count
      puts "#{player.player_one} is the winner"
    else
      puts "#{player.player_two} is the winner"
    end
  elsif !check && gameboard.board.any? { |e| e.is_a?(Integer) }
    player_selection(gameboard, player)
  else
    puts 'Its a draw'
  end
end

def start_game
  gameboard = Board.new
  display_board(gameboard.board)

  puts "Enter first player's Name"
  player_one = gets.chomp
  puts "Enter second player's Name"
  player_two = gets.chomp

  player = Player.new(gameboard, player_one, player_two)

  puts "#{player_one} you are #{player.player_one_tag} \n#{player_two} you are #{player.player_two_tag}"

  player_selection(gameboard, player)
end

start_game
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/AbcSize
