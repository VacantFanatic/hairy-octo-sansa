require 'rails_helper'

RSpec.describe "data_streams/edit", :type => :view do
  before(:each) do
    @data_stream = assign(:data_stream, DataStream.create!(
      :name => "MyString",
      :csdl => "MyString",
      :active => false
    ))
  end

  it "renders the edit data_stream form" do
    render

    assert_select "form[action=?][method=?]", data_stream_path(@data_stream), "post" do

      assert_select "input#data_stream_name[name=?]", "data_stream[name]"

      assert_select "input#data_stream_csdl[name=?]", "data_stream[csdl]"

      assert_select "input#data_stream_active[name=?]", "data_stream[active]"
    end
  end
end
