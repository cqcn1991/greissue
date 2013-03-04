class TopicsController < ApplicationController
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag'
  # GET /topics
  # GET /topics.json
  def index
    #@search = Topic.search do
    #  fulltext params[:search]
    #end
    if params[:tag]
      @topics = Topic.tagged_with(params[:tag])
    else
      #@topics = @search.results
      @topics = Topic.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])
    @topics = Topic.joins(:group_relationships).
        where(:group_relationships => {:topic_group_id => @topic.group_relationships.pluck(:topic_group_id) }).
        uniq.where("group_relationships.topic_id != ?", @topic.id).order("sequ ASC")
    if  @topic.topic_groups.count == 0
      @thoughts=@topic.thoughts.find_with_reputation(:votes, :all, order: 'votes desc')
    else
      @groups= @topic.topic_groups
      @thoughts=Thought.joins(:topic => :group_relationships).
          where(:group_relationships => {:topic_group_id => @topic.group_relationships.pluck(:topic_group_id) }).
          uniq.find_with_reputation(:votes, :all, order: 'votes desc')
    end
    @thought=Thought.new



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])
    if user_signed_in?
      @user= current_user
      @tag_list=params[:topic][:tag_list]
      @user.tag(@topic, :with => @tag_list, :on => :issue_statement )
    end

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end



  def import
    Topic.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end



end
