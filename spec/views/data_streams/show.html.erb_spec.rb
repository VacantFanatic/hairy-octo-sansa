require 'rails_helper'

RSpec.describe "data_streams/show", :type => :view do
  before(:each) do
    @data_stream = assign(:data_stream, DataStream.create!(
      :name => "Name",
      :csdl => "Csdl",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Csdl/)
    expect(rendered).to match(/false/)
  end
end
