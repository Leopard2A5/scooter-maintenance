require "scooters/version"

module Scooters

  def self.min_required_engineers(opts = {})
    opts = {
      cap_manager: nil,
      cap_engineers: nil,
      scooters: nil
    }.merge(opts)

    raise ArgumentError.new("cap_manager is required") unless opts[:cap_manager]
    raise ArgumentError.new("cap_engineers is required") unless opts[:cap_engineers]
    raise ArgumentError.new("scooters is required") unless opts[:scooters]

    42
  end

end
