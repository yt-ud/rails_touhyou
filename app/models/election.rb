class Election < ApplicationRecord
  belongs_to :user
  has_many :candidates, dependent: :destroy
end
