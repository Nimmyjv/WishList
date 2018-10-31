class Createwishs < ActiveRecord::Migration
  def change
    create_table :wishs do |t|
      t.string :name
      t.integer :collection_id
    end
  end
end
