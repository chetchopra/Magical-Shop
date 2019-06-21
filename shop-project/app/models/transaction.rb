class Transaction < ApplicationRecord
    belongs_to :traveler
    belongs_to :shopkeeper
    belongs_to :item 

    def most_frequent_purchased_item
        @transactions = Transition.all
        byebug
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
