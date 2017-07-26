require "spec_helper"

RSpec.describe Scooters do
  it "has a version number" do
    expect(Scooters::VERSION).not_to be nil
  end

  it "requires all three parameters" do
    expect {
      Scooters.min_required_engineers(cap_engineers: 1, scooters: [1])
    }.to raise_exception(ArgumentError)

    expect {
      Scooters.min_required_engineers(cap_manager: 1, scooters: [1])
    }.to raise_exception(ArgumentError)

    expect {
      Scooters.min_required_engineers(cap_manager: 1, cap_engineers: 1)
    }.to raise_exception(ArgumentError)

    expect {
      Scooters.min_required_engineers(cap_manager: 1, cap_engineers: 1, scooters: [1])
    }.not_to raise_exception
  end
end
