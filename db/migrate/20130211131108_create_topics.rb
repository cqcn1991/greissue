class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :issue_statement
      t.integer :instruction_id
      t.integer :sequ

      t.timestamps
    end
  end
end
