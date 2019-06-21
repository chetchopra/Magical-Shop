class Shopinventory < ApplicationRecord
    belongs_to :shopkeeper
    belongs_to :item
    validates :quantity, presence: true

    def name
        return self.item.name
    end

    def name_with_quantity
        return "#{self.item.name} - #{self.quantity} left - #{self.item.cost}g"
    end

    def self.lowest_stocked_item
        min = Shopinventory.minimum(:quantity)
        min_item_record = Shopinventory.where(quantity: min).first
        min_item = Item.find(min_item_record.item_id)

        @low_stock_item = {min_item => min}
    end

    def self.highest_stocked_item
        maxi = Shopinventory.maximum(:quantity)
        max_item_record = Shopinventory.where(quantity: maxi).first
        max_item = Item.find(max_item_record.item_id)

        @high_stock_item = {max_item => maxi}
    end
end
