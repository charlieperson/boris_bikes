require_relative 'bike'

class DockingStation
  def initialize
    @count = 0
    @max_capacity = 20
  end

  attr_reader :bikes

  def release_bike
    raise "No bikes bucko" unless @count > 0        # <= guard clause
    Bike.new
  end

  def dock(bike)
    raise "Max is 20" if @count >= @max_capacity
    @count +=1
    @bikes = bike
  end
end
