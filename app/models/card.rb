class Card < ActiveRecord::Base
  attr_protected :front, :back, :deck_id

  belongs_to :deck_id
  has_many :guesses
end
