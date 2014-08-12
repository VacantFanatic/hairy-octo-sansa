require 'rails_helper'

RSpec.describe "data_streams/new", :type => :view do
  before(:each) do
    assign(:data_stream, DataStream.new(
      :name => "MyString",
      :csdl => "MyString",
      :active => false
    ))
  end

  it "renders new data_stream form" do
    render

    assert_select "form[action=?][method=?]", data_streams_path, "post" do

      assert_select "input#data_stream_name[name=?]", "data_stream[name]"

      assert_select "input#data_stream_csdl[name=?]", "data_stream[csdl]"

      assert_select "input#data_stream_active[name=?]", "data_stream[active]"
    end
  end
end
