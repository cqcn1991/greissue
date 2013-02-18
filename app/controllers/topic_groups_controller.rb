class TopicGroupsController < ApplicationController
  # GET /topic_groups
  # GET /topic_groups.json
  def index
    @topic_groups = TopicGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topic_groups }
    end
  end

  def import
    TopicGroup.import(params[:file])
    redirect_to root_url, notice: "Groups imported."
  end


  # GET /topic_groups/1
  # GET /topic_groups/1.json
  def show
    @topic_group = TopicGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic_group }
    end
  end

  # GET /topic_groups/new
  # GET /topic_groups/new.json
  def new
    @topic_group = TopicGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic_group }
    end
  end

  # GET /topic_groups/1/edit
  def edit
    @topic_group = TopicGroup.find(params[:id])
  end

  # POST /topic_groups
  # POST /topic_groups.json
  def create
    @topic_group = TopicGroup.new(params[:topic_group])

    respond_to do |format|
      if @topic_group.save
        format.html { redirect_to @topic_group, notice: 'Topic group was successfully created.' }
        format.json { render json: @topic_group, status: :created, location: @topic_group }
      else
        format.html { render action: "new" }
        format.json { render json: @topic_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topic_groups/1
  # PUT /topic_groups/1.json
  def update
    @topic_group = TopicGroup.find(params[:id])

    respond_to do |format|
      if @topic_group.update_attributes(params[:topic_group])
        format.html { redirect_to @topic_group, notice: 'Topic group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topic_groups/1
  # DELETE /topic_groups/1.json
  def destroy
    @topic_group = TopicGroup.find(params[:id])
    @topic_group.destroy

    respond_to do |format|
      format.html { redirect_to topic_groups_url }
      format.json { head :no_content }
    end
  end
end
