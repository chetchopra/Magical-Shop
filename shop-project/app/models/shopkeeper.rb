class Shopkeeper < ApplicationRecord
    has_many :transactions
    has_many :travelers, through: :transactions
end
