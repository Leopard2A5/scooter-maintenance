require "scooters/version"

module Scooters

  def self.min_required_engineers(opts = {})
    opts = {
      cap_manager: nil,
      cap_engineers: nil,
      scooters: nil
    }.merge(opts)

    validate_params(opts[:cap_manager], opts[:cap_engineers], opts[:scooters])

    cap_manager = opts[:cap_manager]
    cap_engineers = opts[:cap_engineers]
    scooters = opts[:scooters].clone

    if index = scooters.index(cap_manager)
      scooters.delete_at index
    else
      scooters.sort!
      scooters[-1] = [scooters.last - cap_manager, 0].max
    end

    engineers = 0
    scooters.each do |num_scooters|
      engineers += (num_scooters.to_f / cap_engineers).ceil
    end

    engineers
  end

  def self.validate_params(
    cap_manager,
    cap_engineers,
    scooters
  )
    raise ArgumentError.new("cap_manager is required") unless cap_manager
    raise ArgumentError.new("cap_engineers is required") unless cap_engineers
    raise ArgumentError.new("scooters is required") unless scooters

    raise ArgumentError.new("cap_manager must be at least 0") if cap_manager < 0
    raise ArgumentError.new("cap_engineers must be at least 0") if cap_engineers < 0
    raise ArgumentError.new("scooters must all be at least 0") if scooters.any? { |x| x < 0 }
  end

end
