require 'spec_helper'

describe "topic_groups/new" do
  before(:each) do
    assign(:topic_group, stub_model(TopicGroup).as_new_record)
  end

  it "renders new topic_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topic_groups_path, :method => "post" do
    end
  end
end
