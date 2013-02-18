class Thought < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :topic
  belongs_to :topic_group

  validates_presence_of :content, :topic_id

end
