require "rails_helper"

RSpec.describe DelivariesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/delivaries").to route_to("delivaries#index")
    end

    it "routes to #new" do
      expect(:get => "/delivaries/new").to route_to("delivaries#new")
    end

    it "routes to #show" do
      expect(:get => "/delivaries/1").to route_to("delivaries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/delivaries/1/edit").to route_to("delivaries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/delivaries").to route_to("delivaries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/delivaries/1").to route_to("delivaries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/delivaries/1").to route_to("delivaries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/delivaries/1").to route_to("delivaries#destroy", :id => "1")
    end

  end
end
