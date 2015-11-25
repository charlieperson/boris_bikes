require "docking_station.rb"

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
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq bike
    end

    it 'raise error when one tries to release bikes when there are none' do
      expect{subject.release_bike}.to raise_error("No bikes bucko")
    end

    # it "raise error when docking station is full" do
    #   bike = Bike.new
    #   subject.dock(bike) # fill the dock
    #   expect{subject.dock(bike)}.to raise_error("No space mate- dock is full")
    # end

    it "Default capacity of docking station = 20" do
      20.times {subject.dock Bike.new}
      expect{subject.dock(Bike.new)}.to raise_error("Max is 20")
    end

end



# describe DockingStation do
#   it 'responds to release_bike' do
#     expect(subject).to respond_to :release_bike
#   end
# end
