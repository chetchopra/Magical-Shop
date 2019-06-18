class Shopinventory < ApplicationRecord
    belongs_to :shopkeeper
    belongs_to :item
end
