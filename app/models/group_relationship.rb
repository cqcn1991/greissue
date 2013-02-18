class GroupRelationship < ActiveRecord::Base
  attr_accessible :topic_group_id, :topic_id, :id
  belongs_to :topic
  belongs_to :topic_group

  #validates :topic_group_id, presence: true
  validates :topic_id, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      relationship = find_by_id(row["id"]) || new
      relationship.attributes = row.to_hash
      relationship.save!
    end
  end

end
