class Traveler < ApplicationRecord
    has_many :transactions
    has_many :travelerinventories
    has_many :shopkeepers, through: :transactions
end
