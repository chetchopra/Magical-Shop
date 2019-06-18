class CreateTravelerinventories < ActiveRecord::Migration[5.2]
  def change
    create_table :travelerinventories do |t|
      t.integer :quantity
      t.integer :traveler_id
      t.integer :item_id

      t.timestamps
    end
  end
end
