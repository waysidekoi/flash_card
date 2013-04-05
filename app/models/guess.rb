class Guess < ActiveRecord::Base
  attr_protected :correct, :game_id, :card_id

  belongs_to :game_id
  has_one :card
end
