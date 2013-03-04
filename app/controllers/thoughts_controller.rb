class ThoughtsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @thoughts=Thought.all
  end

  def create
    @topic=Topic.find(params[:topic_id])
    @thought=@topic.thoughts.new(params[:thought])
    @thought.user=current_user
    if @thought.save
      redirect_to @topic, notice:  "Thought added"
    else
      redirect_to @topic, notice:  "Thought added failed"
    end
  end

  def edit
    @thought = Thought.find(params[:id])
    @topic=@thought.topic
  end

  def update
    @thought = Thought.find(params[:id])
    @topic=@thought.topic
    if @thought.update_attributes(params[:thought])
      redirect_to @topic, notice:  "Thought added"
    else
      render edit
    end
  end

  def destroy

    @thought = Thought.find(params[:id])
    @topic=@thought.topic
    if @thought.destroy
      redirect_to @topic, notice: 'destroy succeed'
    else
      redirect_to @topic, alert: 'destory failed'
    end
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @thought = Thought.find(params[:id])
    @thought.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end



end
