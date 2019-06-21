# Starting with categories
def seed_categories
    Category.create(name: "Weapons", description: "For hurting people.")
    Category.create(name: "Armor", description: "For protecting people.")
    Category.create(name: "Potions", description: "For healing people.")
end

def seed_items 
    Item.create(name: "Sword" ,description: "Sharp" ,cost: 10 ,category_id: 1, image_url: "http://pixeljoint.com/files/icons/xavier_slash_combo_by_ben2theedge.gif")
    Item.create(name: "Spear" ,description: "Long and Sharp" ,cost: 15 ,category_id: 1, image_url: "http://pixeljoint.com/files/icons/full/protecteur_l.gif")
    Item.create(name: "Bow and Arrow" ,description: "Long distance attacks" ,cost: 5 ,category_id: 1, image_url: "http://pixeljoint.com/files/icons/full/archer_stage.gif")
    Item.create(name: "Chainmail" ,description: "Heavy but robust" ,cost: 20 ,category_id: 2, image_url: "http://pixeljoint.com/files/icons/lilmailor.gif")
    Item.create(name: "Bootsy" ,description: "Keeps your feet warm and cozy", cost: 15, category_id: 2, image_url: "http://pixeljoint.com/files/icons/puss_in_boots.gif")
    Item.create(name: "Full Armor", description: "Try me, scrub", cost: 100, category_id: 2, image_url: "http://pixeljoint.com/files/icons/full/knight_bw8.gif")


    Item.create(name: "Helmet", description: "You wont be able to see", cost: 15, category_id: 2, image_url: "http://pixeljoint.com/files/icons/full/warriorhead.png")
    Item.create(name: "Health Pot" ,description: "Regenerates lost health" ,cost: 10 ,category_id: 3, image_url: "http://pixeljoint.com/files/icons/potion.gif")
    Item.create(name: "Energy Pot" ,description: "Regenerates lost Energy" ,cost: 10 ,category_id: 3, image_url: "http://pixeljoint.com/files/icons/full/potionbynifty__r16551418561.png")
    Item.create(name: "Everything Pot" ,description: "Restores all of the things" ,cost: 100 ,category_id: 3, image_url: "http://pixeljoint.com/files/icons/potion__r16211781521.png")
end

def seed_shopkeeper
    Shopkeeper.create(shop_name: "Shop of Holding", isOpen: true, password: "shop", password_confirmation: "shop")
end

def seed_travelers
    Traveler.create(name: "Fabian",job: "For Hire",traits: "Dexterity, Charisma, Speed" ,catchphrase: "I'd like some shiny swords" ,gold: 100, password: "fabian", password_confirmation: "fabian")
    Traveler.create(name: "Bryn", job: "Director of Everything", traits: "Determination, Strength" ,catchphrase: "I need to climb another mountain" ,gold: 100, password: "bryn", password_confirmation: "bryn")
    Traveler.create(name: "Chet",job: "For Hire",traits: "Movement, Flexibility" ,catchphrase: "Where is your food" , gold: 100, password: "chet", password_confirmation: "chet")
end

def seed_shop_inventory
    Shopinventory.create(quantity: 10, shopkeeper_id: 1, item_id: 2)
    Shopinventory.create(quantity: 5, shopkeeper_id: 1, item_id: 5)
    Shopinventory.create(quantity: 5, shopkeeper_id: 1, item_id: 6)
    Shopinventory.create(quantity: 3, shopkeeper_id: 1, item_id: 3)
    Shopinventory.create(quantity: 6, shopkeeper_id: 1, item_id: 4)
    Shopinventory.create(quantity: 33, shopkeeper_id: 1, item_id: 7)
    Shopinventory.create(quantity: 26, shopkeeper_id: 1, item_id: 1)
    Shopinventory.create(quantity: 8, shopkeeper_id: 1, item_id: 8)
end

def seed_traveler_inventory
    Travelerinventory.create(quantity: 10, traveler_id: 1, item_id: 1)
    Travelerinventory.create(quantity: 3, traveler_id: 1, item_id: 4)
    Travelerinventory.create(quantity: 5, traveler_id: 1, item_id: 7)
    Travelerinventory.create(quantity: 12, traveler_id: 2, item_id: 3)
    Travelerinventory.create(quantity: 24, traveler_id: 2, item_id: 5)
    Travelerinventory.create(quantity: 6, traveler_id: 2, item_id: 1)
    Travelerinventory.create(quantity: 88, traveler_id: 3, item_id: 8)
    Travelerinventory.create(quantity: 17, traveler_id: 3, item_id: 7)
    Travelerinventory.create(quantity: 53, traveler_id: 3, item_id: 9)
end

def seed
    seed_categories
    seed_items
    seed_shopkeeper
    seed_travelers
    seed_shop_inventory
    seed_traveler_inventory
end

seed

