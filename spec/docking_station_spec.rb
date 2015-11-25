require "~/projects/boris_bikes/lib/docking_station.rb"
DEFAULT_CAPACITY = DockingStation::DEFAULT_CAPACITY

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bikes) }

    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      # bike = subject.release_bike
      expect(subject.release_bike).to be_working
    end

    it 'docks something' do
      bike1 = Bike.new
      expect(subject.dock(bike1)).to eq subject.bikes
    end

    it 'return list of docked bikes' do
      expect(subject.bikes).to eq subject.bikes
    end

    it 'raise error when one tries to release bikes when there are none' do
      expect{subject.release_bike}.to raise_error("No bikes bucko")
    end

    # it "raise error when docking station is full" do
    #   bike = Bike.new
    #   subject.dock(bike) # fill the dock
    #   expect{subject.dock(bike)}.to raise_error("No space mate- dock is full")
    # end

    it "restricts docking at max capacity" do
      DEFAULT_CAPACITY.times {subject.dock Bike.new}
      expect{subject.dock(Bike.new)}.to raise_error("Max is #{subject.capacity}, you currently have #{subject.bikes.length} bikes")
    end

    it "has a default max capacity of 20" do
      expect(subject.capacity).to eq 20
    end

    it "can bike be broken" do
      bike1 = Bike.new
      expect(bike1.working?(false)).to eq bike1.works
    end

    it "bikes can be reported as broken" do
      bike1 = Bike.new
      expect(subject.report(bike1)).to eq false
    end

    it "will not release bike if broken" do
      bike1 = Bike.new
      subject.report(bike1)
      subject.dock(bike1)
      expect{subject.release_bike}.to raise_error "Sorry, this bike is broken"
    end

end



# describe DockingStation do
#   it 'responds to release_bike' do
#     expect(subject).to respond_to :release_bike
#   end
# end
