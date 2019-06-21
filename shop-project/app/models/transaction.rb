class Transaction < ApplicationRecord
    belongs_to :traveler
    belongs_to :shopkeeper
    belongs_to :item 

    def self.most_frequent_purchased_item
        @transactions = Transaction.all
        count = 0
        max_item_id = nil
        
        @frequent = Transaction.distinct.count(:item_id)
        @each_transaction_count = Transaction.group(:item_id).count

        @each_transaction_count.each do |item|
            if item[1] > count
                count = item[1]
                max_item_id = item[0]
            end
            
        end 
        @frequent_me = {max_item_id => count}


        return @frequent_me
        # @transactions.each do |transaction|
        #     byebug
        #     if max_counter > counter
        #         if most_frequently_bought == transaction.item
        #         count+=1
        #     else
        #         most_frequently_bought = transaction 
        #     end
        # end
    end

    def self.highest_sale
        @highest_sales = Transaction.maximum(:total)

    end

    def self.lowest_sale
        @lowest_sales = Transaction.minimum(:total)
    end

    def total_items_of_each_traveler
         #I want to get the total amount of items in a Traveler's Inventory
        #Item is associated with Traveler through Travelinventories
        #Iterate through Travelerinventories (travel_inv)
        #if traveler inventoies 
        @travelerinventories = Travelerinventory.all
        @travelers = Traveler.all
        @traveler_id = 1
        @counter_hash = Hash.new(0)
        @travelerinventories.each do |trav_inv|
            if trav_inv.traveler == @traveler_id
                @counter_hash[trav_inv] += 1
            end
            #byebug
        end

        @counter_hash
        # while count < @travelers.length
        #     @a_traveler = @travelerinventories.where(traveler_id: count)
        # byebug
    end

    def most_items_in_traveler_inventory
        @travelerinventories = Travelerinventory.all

        @travelerinventories.where(traveler_id: 1).count
        counter = 0;
        traveler_of_that_item = nil
        traveler_with_most_items = nil
        counting_items = Hash.new
        
        # @travelerinventories.each do |travel_inv|
        #     if travel_inv.traveler == traveler_with_most_items
        #         if travel_inv.traveler.
        #     byebug
        # end
        # I want to get the most items in a traveler inventory
        # get a traveler
        # get the traveler's items count through travelerinventory
        # counter to count the items
        byebug
    end

    def most_gold_spent_by_traveler

    end

    def self.most_expensive_item
        
    end

    def self.cheapest_item

    end

end
