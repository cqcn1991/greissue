class TopicGroup < ActiveRecord::Base
  attr_accessible :title, :description, :topic_ids, :id
  has_many :group_relationships
  has_many :topics, through: :group_relationships
  has_many :thoughts, through: :topics
  accepts_nested_attributes_for :group_relationships


  validates_presence_of :title

  # attr_accessible :title, :body

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      topic_group = find_by_id(row["id"]) || new
      topic_group.attributes = row.to_hash.slice(*accessible_attributes)
      topic_group.save!
    end
  end

end
