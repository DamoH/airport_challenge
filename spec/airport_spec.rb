require 'airport'
# require 'plane'

describe Airport do

  plane = Plane.new

  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'has landed planes?' do
    expect(subject.planes?)
  end

# code review... use "subject" instead of airport(s)..
  it 'lands planes' do
    airport = Airport.new #... and get rid of this line.
    # stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(false)
# code review... alternative.....    ){false}

    expect(airport.land(plane)).to eq("plane has landed")
  end

  it 'doesnt allow landing when stormy' do
    airport = Airport.new
    # stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(true)
    expect { airport.land(plane) }.to raise_error("weather is too bad for landing")
  end

  it 'doesnt allow take off when stormy' do
    airport = Airport.new
    # stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(true)
    expect { airport.take_off(plane) }.to raise_error("weather is too bad for take-off")
  end

  it 'returns stormy weather "true"' do
    airport = Airport.new
    # stormy = double("stormy")
    allow(airport).to receive(:stormy).and_return(true)
  end

  it 'doesnt allow landing when full capacity' do
    airport = Airport.new # code review
    allow(airport).to receive(:stormy).and_return(false) # code review
    airport.capacity.times { airport.land(plane) }
    expect(airport.land(plane)).to eq("airport is full - no landings allowed")
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  # it 'responds to DEFAULT_CAPACITY' do
  #   expect(subject).to respond_to :DEFAULT_CAPACITY
  # end

end
