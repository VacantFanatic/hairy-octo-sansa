require "rails_helper"

RSpec.describe DataStreamsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/data_streams").to route_to("data_streams#index")
    end

    it "routes to #new" do
      expect(:get => "/data_streams/new").to route_to("data_streams#new")
    end

    it "routes to #show" do
      expect(:get => "/data_streams/1").to route_to("data_streams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/data_streams/1/edit").to route_to("data_streams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/data_streams").to route_to("data_streams#create")
    end

    it "routes to #update" do
      expect(:put => "/data_streams/1").to route_to("data_streams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/data_streams/1").to route_to("data_streams#destroy", :id => "1")
    end

  end
end
