class Traveler < ApplicationRecord
    has_many :transactions
    has_many :travelerinventories
    has_many :shopkeepers, through: :transactions
    validates :name, uniqueness: true

    has_secure_password

    def my_inventory
        travelinv = self.travelerinventories
    end

end
