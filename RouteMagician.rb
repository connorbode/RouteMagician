require 'ai4r'
require 'priority_queue'


# override of AI4R method for euclidian distance
module Ai4r
  module Clusterers
    class KMeans
      def distance a, b
        x = (a[1][0]-b[1][0]) ** 2
        y = (a[1][1]-b[1][1]) ** 2
        Math.sqrt(x+y)
      end
    end
  end
end

class RouteMagician

  include Ai4r::Clusterers
  include Ai4r::Data

  def initialize data, config
    @data = data
    @deliverers = config[:deliverers]
    @iterations = config[:iterations]
  end

  def compute
    data = DataSet.new :data_items => @data, :data_labels => ["name", ["X", "Y"]]
    clusterer = KMeans.new.build(data, @deliverers)

    response = []

    @data.each do |d|
      cluster = clusterer.eval(d) # figure out which cluster the item belongs to
      response[cluster] = [] unless response[cluster].kind_of?(Array) 
      response[cluster] << d
    end

    response
  end
end

class ShortestRouteSearch

  def initialize data, seeds

    # list
    @routes = PriorityQueue.new

    # seed the list
    i = 0
    until i == seeds do
      @routes[data.shuffle] = sum_euclidian data
      i += 1
    end

  end

  def sum_euclidian data
    sum = 0
    for i in 0..data.length-2
      sum += euclidian data[i], data[i+1]
    end
    sum
  end 

  def euclidian a, b
    x = (a[0]-b[0])**2
    y = (a[1]-b[1])**2
    Math.sqrt(x+y)
  end

  def compute
    min = @routes.min[0]
    until i == 0

    end
  end
end