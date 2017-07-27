require "spec_helper"

RSpec.describe Scooters do
  DEFAULT = {
    cap_manager: 1,
    cap_engineers: 1,
    scooters: [1]
  }

  def DEFAULT.except(*exceptions)
    self.clone.delete_if {|k, _| exceptions.include? k }
  end

  def DEFAULT.with(hash)
    self.clone.merge(hash)
  end

  it "has a version number" do
    expect(Scooters::VERSION).not_to be nil
  end

  it "works doesn't fail with valid params" do
    expect {
      Scooters.min_required_engineers(DEFAULT)
    }.not_to raise_exception
  end

  it "requires all three parameters" do
    expect {
      Scooters.min_required_engineers(DEFAULT.except :cap_manager)
    }.to raise_exception(ArgumentError)

    expect {
      Scooters.min_required_engineers(DEFAULT.except :cap_engineers)
    }.to raise_exception(ArgumentError)

    expect {
      Scooters.min_required_engineers(DEFAULT.except :scooters)
    }.to raise_exception(ArgumentError)
  end

  it "validates cap parameters" do
    expect {
      Scooters.min_required_engineers(DEFAULT.with cap_manager: -1)
    }.to raise_exception(ArgumentError)

    expect {
      Scooters.min_required_engineers(DEFAULT.with cap_engineers: -1)
    }.to raise_exception(ArgumentError)
  end

  it "validates scooters array" do
    expect {
      Scooters.min_required_engineers(DEFAULT.with scooters: [1, 2, -1])
    }.to raise_exception(ArgumentError)
  end
end
