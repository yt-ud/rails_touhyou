class Election < ApplicationRecord
  has_secure_password
  belongs_to :user
  has_many :candidates, dependent: :destroy
end
