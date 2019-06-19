class AddPasswordDigestToTravelers < ActiveRecord::Migration[5.2]
  def change
    add_column :travelers, :password_digest, :string
  end
end
