class Game < ActiveRecord::Base
  attr_protected :user_id, :deck_id

  has_one :deck
  belongs_to :user
end
