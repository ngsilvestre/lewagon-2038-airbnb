class AddOwnerToListing < ActiveRecord::Migration[7.1]
  def change
    add_reference :listings, :owner, null: false, foreign_key: { to_table: :users }
  end
end
