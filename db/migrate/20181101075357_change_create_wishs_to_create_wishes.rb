class ChangeCreateWishsToCreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.integer :collection_id
    end
  end
end
