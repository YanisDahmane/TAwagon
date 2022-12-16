class Solution < ApplicationRecord
  has_many :party_solutions
  has_many :parties, through: :party_solutions
end
