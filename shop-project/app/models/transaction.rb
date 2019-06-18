class Transaction < ApplicationRecord
    belongs_to :traveler
    belongs_to :shopkeeper
    belongs_to :item 
end
