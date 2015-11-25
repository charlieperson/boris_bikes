require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    empty?
    if @bikes.last.works      # .LAST IS NOT IDEAL
      @bikes.pop
    else
      raise "Sorry, this bike is broken"
    end
  end

  def dock(bike)
    full?
    @bikes << bike
  end

  def report(bike)
    bike.works = false
    bike.works
  end

    private

  def full?
    raise "Max is #{@capacity}, you currently have #{@bikes.length} bikes" if @bikes.length >= @capacity
  end

  def empty?
    raise "No bikes bucko" unless @bikes.length > 0
  end
end
