class GroupRelationshipsController < ApplicationController
  def create
     #@group= IssueGroup.find(params[:group_relationships][:issue_group_id])
     #@topic=Topic.find(params[:group_relationships][:topic_id])
     #@topic.join!(@group)
  end

  def destroy
  end

  def import
    GroupRelationship.import(params[:file])
    redirect_to root_url, notice: "Relationships imported."
  end
end
