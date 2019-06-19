class Shopkeeper < ApplicationRecord
    has_many :transactions
    has_many :shopinventories
    has_many :travelers, through: :transactions

    has_secure_password
end


