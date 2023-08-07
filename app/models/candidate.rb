class Candidate < ApplicationRecord
  belongs_to :election
  has_many :votes, dependent: :destroy
#  delegate :user, to: :election
end
