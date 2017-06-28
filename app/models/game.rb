class Game < ApplicationRecord
	validates :users, length: { is: 4 }
	has_many :game_players
	has_many :users, through: :game_players
	after_create :distribute_tiles
	attr_accessor :tiles 
 
  def self.make(users)
    game = Game.new
    users.each{|user| game.users << user}
    game
  end

  def distribute_tiles
  	shuffle_tiles
    assign_order
  	self.game_players.each do |player| 
  		player.tiles = @tiles.slice(0, 7) 
  		player.save
  	end
  	self.tiles_played = []
  	self.status = 'Active'
    self.turn = 1
  	save
  end

  def assign_order
    order  = [1,2,3,4].shuffle!
    self.game_players.each do |player| 
      player.player_order = order.pop 
      player.save
    end
  end

  def shuffle_tiles
    arr  = ['zero', 'one', 'two', 'three', 'four', 'five', 'six']
    arr1 = ['zero', 'one', 'two', 'three', 'four', 'five', 'six']
    @tiles  = []
    arr.each do |ele| 
      arr1.each do |a| 
        @tiles.push("#{ele}-#{a}") 
      end
      arr1.shift
    end
    @tiles.shuffle!
  end

end
