class Topic < ActiveRecord::Base
  attr_accessible :issue_statement, :instruction_id, :sequ
  belongs_to :instruction

  validates :issue_statement, presence: true



  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      topic = find_by_id(row["id"]) || new
      topic.attributes = row.to_hash.slice(*accessible_attributes)
      topic.save!
      #topic = Topic.new(
      #    :sequ => row[1],
      #    :issue_statement => row[2],
      #    :instruction_id => row[3],
      #)
      #topic.save!

    end
  end



end
