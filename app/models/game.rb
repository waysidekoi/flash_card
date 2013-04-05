class Game < ActiveRecord::Base
  attr_protected :user_id, :deck_id

  belongs_to :deck
  belongs_to :user
end
