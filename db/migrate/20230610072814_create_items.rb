class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false

      # チャレンジ機能
      # t.integer :genre_id, null: false
      # t.boolean :is_active, null: false
      # ここまで
      t.timestamps
    end
  end
end
