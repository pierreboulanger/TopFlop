class Game < ApplicationRecord
  has_many :tops
  has_many :flops

  belongs_to :team
end
