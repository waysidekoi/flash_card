class Guess < ActiveRecord::Base
  attr_protected :correct, :game_id, :card_id

  belongs_to :game
  has_one :card
end
