require 'spec_helper'

describe "topic_groups/show" do
  before(:each) do
    @topic_group = assign(:topic_group, stub_model(TopicGroup))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
