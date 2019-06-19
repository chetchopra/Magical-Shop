class Shopkeeper < ApplicationRecord
    has_many :transactions
    has_many :shopinventories
    has_many :travelers, through: :transactions
end


