require 'spec_helper'

describe "topics/index" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic,
        :issue_statement => "Issue Statement"
      ),
      stub_model(Topic,
        :issue_statement => "Issue Statement"
      )
    ])
  end

  it "renders a list of topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Issue Statement".to_s, :count => 2
  end
end
