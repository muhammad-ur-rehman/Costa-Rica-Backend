class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :category
      t.float :price

      t.timestamps
    end
  end
end
