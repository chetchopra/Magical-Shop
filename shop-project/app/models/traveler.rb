class Traveler < ApplicationRecord
    has_many :transactions
    has_many :travelerinventories
    has_many :shopkeepers, through: :transactions

    has_secure_password

    def init
        self.gold = 100
    end
end
