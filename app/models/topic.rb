class Topic < ActiveRecord::Base
  attr_accessible :issue_statement, :instruction_id, :sequ, :tag_list, :category_id, :id
  belongs_to :instruction
  belongs_to :category
  has_many :thoughts
  has_many :group_relationships
  has_many  :topic_groups, through: :group_relationships
  acts_as_taggable


  default_scope order: 'topics.sequ ASC'
  validates :issue_statement, presence: true

  searchable do
    text :issue_statement
    integer :sequ
    text :thoughts do
      thoughts.map(&:content)
    end
    #text :instruction do
    #  instructions.map(&:content)
    #end
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      topic = find_by_id(row["id"]) || new
      topic.attributes = row.to_hash.slice(*accessible_attributes)
      topic.save!
    end
  end




  def to_label

    "<div> #{issue_statement} | #{sequ} </div>".html_safe

  end

  def join!(group)
    group_relationships.create!(issue_group_id: group.id)
  end

  def unjoin!(group)
    group_relationships.find_by_issue_group_id(group.id).destroy
  end

  def join?(group)
    group_relationships.find_by_issue_group_id(group.id)
  end

end
