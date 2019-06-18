class Travelerinventory < ApplicationRecord
    belongs_to :traveler
    belongs_to :item
end
