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

    end

    def most_items_in_traveler_inventory

    end

    def most_gold_spent_by_traveler

    end

    def self.most_expensive_item
        
    end

    def self.cheapest_item

    end

end
