class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.string :location
      t.float :price
      t.integer :num_guests
      t.text :description

      t.timestamps
    end
  end
end
