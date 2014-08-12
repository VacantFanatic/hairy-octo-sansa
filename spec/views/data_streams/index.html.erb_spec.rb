require 'rails_helper'

RSpec.describe "data_streams/index", :type => :view do
  before(:each) do
    assign(:data_streams, [
      DataStream.create!(
        :name => "Name",
        :csdl => "Csdl",
        :active => false
      ),
      DataStream.create!(
        :name => "Name",
        :csdl => "Csdl",
        :active => false
      )
    ])
  end

  it "renders a list of data_streams" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Csdl".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
