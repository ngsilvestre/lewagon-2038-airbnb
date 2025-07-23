class AddTitleToListing < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :title, :string
  end
end
