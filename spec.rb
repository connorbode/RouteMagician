require 'json'
require_relative "RouteMagician.rb"

describe RouteMagician, "#tests" do

  before :all do
    @data = JSON.parse(IO.read("test_data.json"))
  end

  it "can add a set of locations" do
    mage = RouteMagician.new @data, :deliverers => 1, :iterations => 1
    true.should eq true
  end

  it "computes the right number of clusters" do
    mage = RouteMagician.new @data, :deliverers => 1, :iterations => 1
    mage.compute.length.should eq 1

    mage = RouteMagician.new @data, {:deliverers => 3, :iterations => 1}
    # require 'pry-debugger'; binding.pry
    mage.compute.length.should eq 3

    mage = RouteMagician.new @data, :deliverers => 6, :iterations => 1
    mage.compute.length.should eq 6
  end


end