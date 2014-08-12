require 'rails_helper'

RSpec.describe "DataStreams", :type => :request do
  describe "GET /data_streams" do
    it "works! (now write some real specs)" do
      get data_streams_path
      expect(response.status).to be(200)
    end
  end
end
