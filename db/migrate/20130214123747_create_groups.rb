class CreateGroups < ActiveRecord::Migration
  def change
    create_table :issue_groups do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
