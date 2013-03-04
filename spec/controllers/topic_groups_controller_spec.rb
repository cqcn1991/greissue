require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TopicGroupsController do

  # This should return the minimal set of attributes required to create a valid
  # TopicGroup. As you add validations to TopicGroup, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TopicGroupsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all topic_groups as @topic_groups" do
      topic_group = TopicGroup.create! valid_attributes
      get :index, {}, valid_session
      assigns(:topic_groups).should eq([topic_group])
    end
  end

  describe "GET show" do
    it "assigns the requested topic_group as @topic_group" do
      topic_group = TopicGroup.create! valid_attributes
      get :show, {:id => topic_group.to_param}, valid_session
      assigns(:topic_group).should eq(topic_group)
    end
  end

  describe "GET new" do
    it "assigns a new topic_group as @topic_group" do
      get :new, {}, valid_session
      assigns(:topic_group).should be_a_new(TopicGroup)
    end
  end

  describe "GET edit" do
    it "assigns the requested topic_group as @topic_group" do
      topic_group = TopicGroup.create! valid_attributes
      get :edit, {:id => topic_group.to_param}, valid_session
      assigns(:topic_group).should eq(topic_group)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new TopicGroup" do
        expect {
          post :create, {:topic_group => valid_attributes}, valid_session
        }.to change(TopicGroup, :count).by(1)
      end

      it "assigns a newly created topic_group as @topic_group" do
        post :create, {:topic_group => valid_attributes}, valid_session
        assigns(:topic_group).should be_a(TopicGroup)
        assigns(:topic_group).should be_persisted
      end

      it "redirects to the created topic_group" do
        post :create, {:topic_group => valid_attributes}, valid_session
        response.should redirect_to(TopicGroup.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved topic_group as @topic_group" do
        # Trigger the behavior that occurs when invalid params are submitted
        TopicGroup.any_instance.stub(:save).and_return(false)
        post :create, {:topic_group => {}}, valid_session
        assigns(:topic_group).should be_a_new(TopicGroup)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        TopicGroup.any_instance.stub(:save).and_return(false)
        post :create, {:topic_group => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested topic_group" do
        topic_group = TopicGroup.create! valid_attributes
        # Assuming there are no other topic_groups in the database, this
        # specifies that the TopicGroup created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        TopicGroup.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => topic_group.to_param, :topic_group => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested topic_group as @topic_group" do
        topic_group = TopicGroup.create! valid_attributes
        put :update, {:id => topic_group.to_param, :topic_group => valid_attributes}, valid_session
        assigns(:topic_group).should eq(topic_group)
      end

      it "redirects to the topic_group" do
        topic_group = TopicGroup.create! valid_attributes
        put :update, {:id => topic_group.to_param, :topic_group => valid_attributes}, valid_session
        response.should redirect_to(topic_group)
      end
    end

    describe "with invalid params" do
      it "assigns the topic_group as @topic_group" do
        topic_group = TopicGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TopicGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => topic_group.to_param, :topic_group => {}}, valid_session
        assigns(:topic_group).should eq(topic_group)
      end

      it "re-renders the 'edit' template" do
        topic_group = TopicGroup.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        TopicGroup.any_instance.stub(:save).and_return(false)
        put :update, {:id => topic_group.to_param, :topic_group => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested topic_group" do
      topic_group = TopicGroup.create! valid_attributes
      expect {
        delete :destroy, {:id => topic_group.to_param}, valid_session
      }.to change(TopicGroup, :count).by(-1)
    end

    it "redirects to the topic_groups list" do
      topic_group = TopicGroup.create! valid_attributes
      delete :destroy, {:id => topic_group.to_param}, valid_session
      response.should redirect_to(topic_groups_url)
    end
  end

end