class User < ActiveRecord::Base
  attr_accessible :user

  has_many :games
end
