require 'spec_helper'

describe "topic_groups/index" do
  before(:each) do
    assign(:topic_groups, [
      stub_model(TopicGroup),
      stub_model(TopicGroup)
    ])
  end

  it "renders a list of topic_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
