class Bike
  # attr_accessor :broken
  #
  # def broken= broken
  #   @broken = broken
  # end
  #
  # def broken
  #   @broken
  # end
  def initialize
    @works = true
  end

  attr_accessor :works


  def working? (working = true)
    if working
      @works = true
    else
      @works = false
    end
  end

end
