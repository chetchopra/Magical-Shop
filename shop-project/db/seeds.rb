# Starting with categories
def seed_categories
    Category.create(name: "Weapons", description: "For hurting people.")
    Category.create(name: "Armor", description: "For protecting people.")
    Category.create(name: "Potions", description: "For healing people.")
end

def seed_items 
    Item.create(name: "Sword" ,description: "Sharp" ,cost: 10 ,category_id: 1)
    Item.create(name: "Spear" ,description: "Long and Sharp" ,cost: 15 ,category_id: 1)
    Item.create(name: "Bow and Arrow" ,description: "Long distance attacks" ,cost: 5 ,category_id: 1)
    Item.create(name: "Chainmail" ,description: "Heavy but robust" ,cost: 20 ,category_id: 2)
    Item.create(name: "Chest Plate" ,description: "Heavy and rigid" ,cost: 25 ,category_id: 2)
    Item.create(name: "Helmet" ,description: "You wont be able to see" ,cost: 15 ,category_id: 2)
    Item.create(name: "Health Pot" ,description: "Regenerates lost health" ,cost: 10 ,category_id: 3)
    Item.create(name: "Energy Pot" ,description: "Regenerates lost Energy" ,cost: 10 ,category_id: 3)
    Item.create(name: "Mental Pot" ,description: "Restores mental strengt" ,cost: 15 ,category_id: 3)
end

def seed_shopkeeper
    Shopkeeper.create(shop_name: "Shop of Holding", isOpen: true)
end

def seed_travelers
    Traveler.create(name: "Fabian",job: "For Hire",traits: "Dexterity, Charisma, Speed" ,catchphrase: "I'd like some shiny swords" ,gold: 100)
    Traveler.create(name: "Bryn", job: "Director of Everything", traits: "Determination, Strength" ,catchphrase: "I need to climb another mountain" ,gold: 1000)
    Traveler.create(name: "Chet",job: "For Hire",traits: "Movement, Flexibility" ,catchphrase: "Where is your food" ,gold: 1000)
end

def seed
    seed_categories
    seed_items
    seed_shopkeeper
    seed_travelers
end

seed

