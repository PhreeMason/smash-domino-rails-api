class Game < ApplicationRecord
	has_many :users through: :game_players

  @@tiles = ["zero-zero", "zero-one", "zero-two", "zero-three", "zero-four", "zero-five", "zero-six", "one-one", "one-two", "one-three", "one-four", "one-five", "one-six", "two-two", "two-three", "two-four", "two-five", "two-six", "three-three", "three-four", "three-five", "three-six", "four-four", "four-five", "four-six", "five-five", "five-six", "six-six"]


end
