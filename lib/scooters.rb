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

    raise ArgumentError.new("cap_manager must be at least 0") if opts[:cap_manager] < 0
    raise ArgumentError.new("cap_engineers must be at least 0") if opts[:cap_engineers] < 0
    raise ArgumentError.new("scooters must all be at least 0") if opts[:scooters].any? { |x| x < 0 }

    return 0 if opts[:scooters].length == 0

    rest = opts[:scooters][0] - opts[:cap_manager]
    if rest > 0
      exact = rest.to_f / opts[:cap_engineers]
      exact.ceil
    else
      0
    end
  end

end
