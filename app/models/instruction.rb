class Instruction < ActiveRecord::Base
  attr_accessible :content, :id
  has_many :topics

  validates :content, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      instruction = find_by_id(row["id"]) || new
      instruction.attributes = row.to_hash.slice(*accessible_attributes)
      instruction.save!
      #topic = Topic.new(
      #    :sequ => row[1],
      #    :issue_statement => row[2],
      #    :instruction_id => row[3],
      #)
      #topic.save!

    end
  end


end
