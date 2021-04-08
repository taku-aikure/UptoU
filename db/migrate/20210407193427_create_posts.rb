class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.text :detail,        null: false
      t.integer :season_id,  null: false
      t.references :user,    foreign_key: true

      t.timestamps
    end
  end
end
