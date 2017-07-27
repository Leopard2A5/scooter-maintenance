require 'spec_helper'

RSpec.describe Scooters do

  it 'returns the right result with a single small region' do
    (0..4).each do |num_scooters|
      expect(Scooters.min_required_engineers(
        cap_manager: 4,
        cap_engineers: 3,
        scooters: [num_scooters]
      )).to eq(0)
    end
  end

  it 'returns the right result with a single big region' do
    expect(Scooters.min_required_engineers(
      cap_manager: 5,
      cap_engineers: 2,
      scooters: [6]
    )).to eq(1)

    expect(Scooters.min_required_engineers(
      cap_manager: 5,
      cap_engineers: 2,
      scooters: [9]
    )).to eq(2)
  end

end
