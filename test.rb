require 'json'
require 'ai4r'
require_relative "RouteMagician.rb"

include Ai4r::Clusterers
include Ai4r::Data

# kmeans = KMeans.new(data, :centroids => 2)

data = JSON.parse(IO.read("test_data.json"))

input_data = []
data.each do |d| 
  input_data << [d['lat'], d['lng']]
end
r = RouteMagician.new input_data, {:deliverers => 3, :iterations => 10}
p r.compute

# data_set = DataSet.new(:data_items => input_data, :data_labels => ["X", "Y"])
# clusterer = KMeans.new.build(data_set, 3)

# data.each do |d|
#   item = [d['lat'],d['lng']]
#   puts "#{d['name']} belongs to #{clusterer.eval(item)}"
# end


# r = RouteMagician.new data, 3
# r.compute