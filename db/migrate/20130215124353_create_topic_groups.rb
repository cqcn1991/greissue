class CreateTopicGroups < ActiveRecord::Migration
  def change
    create_table :topic_groups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
