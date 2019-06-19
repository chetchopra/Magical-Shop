class CreateTravelers < ActiveRecord::Migration[5.2]
  def change
    create_table :travelers do |t|
      t.string :name
      t.string :job
      t.string :traits
      t.string :catchphrase
      t.integer :gold

      t.timestamps
    end
  end
end