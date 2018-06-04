class Team < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :players
end
