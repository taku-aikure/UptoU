class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|

      t.integer :category_id,           null: false
      t.text :description,          null: false
      t.references :user,           foreign_key: true

      t.timestamps
    end
  end
end
