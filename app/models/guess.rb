class Guess < ActiveRecord::Base
  attr_protected :game_id, :card_id
  attr_accessible :correct

  belongs_to :game
  belongs_to :card
end
