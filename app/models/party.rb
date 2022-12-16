class Party < ApplicationRecord
  has_many :party_solutions
  has_many :solutions, through: :party_solutions
  belongs_to :game
end
