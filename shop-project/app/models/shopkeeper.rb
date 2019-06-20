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


end


