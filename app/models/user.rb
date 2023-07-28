class User < ApplicationRecord
    has_secure_password
    has_many :elections, dependent: :destroy
    has_many :candidates, through: :election
    has_many :votes, through: [:election, :candidates]
end
