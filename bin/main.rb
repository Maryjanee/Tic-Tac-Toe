#!/usr/bin/env ruby
# rubocop:disable Style/IdenticalConditionalBranches
# rubocop:disable Style/DoubleNegation
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game_messages.rb'

class Game
  include GameMessages
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
    puts "It's the #{player.current_player}'s turn, Please Choose a number between 1 - 9"
    input = gets.chomp.to_i

    while input.between?(1, 9) == false
      puts 'Invalid! Please choose a number between 1 - 9'
      input = gets.chomp.to_i
    end

    if player.valid_move(input)
      player.insert_into_board(input)
    else
      puts 'That position has been taken! please choose another available position'
      player_selection(gameboard, player)
    end

    display_board(gameboard.board)

    check = player.winner_checker(gameboard.board)

    if check
      x_count = gameboard.board.count { |x| x == '✘' }
      o_count = gameboard.board.count { |x| x == '◯' }
      if x_count > o_count
        puts "#{player.player_one} is the winner"
        play_again
      else
        puts "#{player.player_two} is the winner"
        play_again
      end
    elsif !check && gameboard.board.any? { |e| e.is_a?(Integer) }
      player_selection(gameboard, player)
    else
      puts 'Its a draw'
      play_again
    end
  end

  def start_game
    gameboard = Board.new

    puts "Enter first player's Name"
    player_one = gets.chomp

    while !!(player_one =~ /^(\s*|\d+)$/)
      puts 'please enter a valid name'
      player_one = gets.chomp
    end

    puts "Enter second player's Name"
    player_two = gets.chomp

    while !!(player_two =~ /^(\s*|\d+)$/)
      puts 'please enter a valid name'
      player_two = gets.chomp
    end
    player = Player.new(gameboard, player_one, player_two)

    puts "#{player_one} you are #{player.player_one_tag} \n#{player_two} you are #{player.player_two_tag}"

    display_board(gameboard.board)

    player_selection(gameboard, player)
  end

  def play_again
    puts 'Would you like to play again? Y/N '
    answer = gets.chomp.upcase

    start_game if answer == 'Y'
  end
end
tictactoe_game = Game.new

tictactoe_game.start_game
# rubocop:enable Style/IdenticalConditionalBranches
# rubocop:enable Style/DoubleNegation
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
