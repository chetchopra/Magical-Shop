class CreateShopinventories < ActiveRecord::Migration[5.2]
  def change
    create_table :shopinventories do |t|
      t.integer :quantity
      t.integer :shopkeeper_id
      t.integer :item_id

      t.timestamps
    end
  end
end
