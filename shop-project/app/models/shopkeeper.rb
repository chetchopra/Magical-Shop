class Shopkeeper < ApplicationRecord
    has_many :transactions
    has_many :shopinventories
    has_many :travelers, through: :transactions
    validates :shop_name, uniqueness: true

    has_secure_password

    #Get all items in Shop
    def get_shopinventories
        self.shopinventories 
    end

    #Get all Shop Items Objects
    def shopinventories_item
        self.get_shopinventories.collect do |shopinventory|
            shopinventory.item
        end
    end

    #Get Shop Inventory Item Name, Price, Quantity
    def shopinventories_display
        self.get_shopinventories.collect do |shopinventory|
            "Name: #{shopinventory.item.name} || Price: #{shopinventory.item.cost} || Quantity: #{shopinventory.quantity}"
        end
    end

    #Get all items
    def all_items_display
        Item.all.collect do |item|
            "Name: #{item.name} || Cost: #{item.cost} || Category #{item.category.name}"
        end       
    end

    #---------------------------------------#
    #---------------------------------------#

    def most_frequent_purchased_item
        # @transactions = Transaction.all
        # counter = 0
        # max_counter = 0
        # most_frequently_bought = nil
        
        # @transactions.each do |transaction|
        #     byebug
        #     if most_frequently_bought == transaction.item
        #         counter +=1
        #         if
        #     end
        # end
    end

    def most_items_in_traveler_inventory

    end

    def most_gold_spent_by_traveler

    end

    def most_expensive_item

    end

    def cheapest_item

    end

    def lowest_stocked_item

    end

    def highest_stocked_item

    end
end


