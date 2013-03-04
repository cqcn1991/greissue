class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.text :content
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :thoughts, :user_id
    add_index :thoughts, :topic_id
  end
end
