require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
# require_relative '../bin/main.rb'


describe "Player"  do
  let (:gameboard) {['✘','✘','✘',3,'◯','◯',7 ,8 ,9 ]}
  let (:player_one) {"Ade"}
  let(:player_two) {"Olu"}
  let (:input) {5}
  
  describe "winner checker method returns true" do
    it "return the instance variables to start the game" do
      player = Player.new(gameboard,player_one,player_two) 
      expect(player.winner_checker(gameboard)).to eql(true)
    end
  end
  
  describe "#winner_checker" do
    it "returns false for an invalid move " do
      player = Player.new(gameboard,player_one,player_two) 
      expect(player.valid_move(2)).to eql(false)  
    end

    it "returns true for an valid move " do
      player = Player.new(['✘','✘',2,3,'◯','◯',7 ,8 ,9 ],player_one,player_two) 
      expect(player.valid_move(8)).to eql(true)  
    end

    it "returns true for a valid range of valid input " do
      player = Player.new([*1..9 ],player_one,player_two) 
      expect(player.valid_move(17)).not_to eql(false)  
    end
   
  end
  
  describe "#current_player" do
    it "returns the current player" do
      player = Player.new(gameboard,player_one,player_two) 
      expect(player.current_player).to eql("Ade") 
    end
  end 
  
  describe "#insert_into_board" do
  it "updates and returns play counter variable" do
    player = Player.new(gameboard,player_one,player_two) 
    expect(player.insert_into_board(7)).to eql(1) 
  end
end 
    
end