require 'spec_helper'

describe "topic_groups/edit" do
  before(:each) do
    @topic_group = assign(:topic_group, stub_model(TopicGroup))
  end

  it "renders the edit topic_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topic_groups_path(@topic_group), :method => "post" do
    end
  end
end
