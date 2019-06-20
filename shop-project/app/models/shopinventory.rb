class Shopinventory < ApplicationRecord
    belongs_to :shopkeeper
    belongs_to :item
    validates :quantity, presence: true

    def name
        return self.item.name
    end

    def name_with_quantity
        return "#{self.item.name} - #{self.quantity}g"
    end
end
