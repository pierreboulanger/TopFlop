class Game < ApplicationRecord
  has_many :tops, dependent: :destroy
  has_many :flops, dependent: :destroy

  belongs_to :team
end
