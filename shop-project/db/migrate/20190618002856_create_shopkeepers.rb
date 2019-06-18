class CreateShopkeepers < ActiveRecord::Migration[5.2]
  def change
    create_table :shopkeepers do |t|
      t.string :shop_name
      t.boolean :isOpen

      t.timestamps
    end
  end
end
