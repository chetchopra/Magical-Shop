class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :total
      t.integer :traveler_id
      t.integer :shopkeeper_id
      t.integer :item_id

      t.timestamps
    end
  end
end
