class CreateGroupRelationships < ActiveRecord::Migration
  def change
    create_table :group_relationships do |t|
      t.integer :topic_id
      t.integer :topic_group_id

      t.timestamps
    end
    add_index :group_relationships,  :topic_group_id
    add_index :group_relationships,  :topic_id
    add_index :group_relationships, [:topic_id, :topic_group_id], unique: true
  end
end
