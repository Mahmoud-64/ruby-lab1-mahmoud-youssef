class CreateItem2s < ActiveRecord::Migration[6.0]
  def change
    create_table :item2s do |t|
      t.string :item_name
      t.string :item_description

      t.timestamps
    end
  end
end
