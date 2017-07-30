![](https://travis-ci.org/Leopard2A5/scooter-maintenance.svg?branch=master)

# Scooters

This is a tool to help determine the required number of engineers to maintain a fleet of scooters.

## Installation

After checking out the repository, install the gem locally with
```bash
bundle install
rake install
```
The executable `scooters` should then be in your `PATH`.

> Uninstall like so: `gem uninstall scooters`.

## Usage

Print usage instructions with
```bash
scooters --help
```

Example:
```bash
scooters --cap-manager 6 --cap-engineers 5 --scooters 4,5,3,8,5
```

## Unit testing

Running the unit tests is the default rake task. Run the unit tests like so:
```bash
rake
```
Find the code coverage report in `coverage/index.html`.

## Assumptions

1. No assumptions about the capacities of manager and engineers, except their being at least 0.
1. The number of scooters in each region is at least 0.
1. All parameters are mandatory, no default values are applied.

## Considerations

This is a typical optimization problem. Depending on the importance of finding an optimal solution I'd consider using dynamic programming to solve the problem. Given a time window of 4h for the software, however, I'll settle for a suboptimal implementation.

The implemented algorithm tries to find a perfect fit for the manager, or, if not possible, assign the manager to the biggest region. The program subsequently fills up the remaining regions with engineers. This, however, is not optimal in certain constellations.

Given a manager's capacity of `3`, an engineers' capacity of `4` and a scooters array of `[8, 2, 4]`, the implementation finds this (suboptimal) solution:
```
scooters[0] = 8 -> manager, 2x engineer
scooters[1] = 2 -> 1x engineer
scooters[2] = 4 -> 1x engineer
```

Thus, the implementation returns a result of 4 fleet engineers, whereas the optimal solution is 3:
```
scooters[0] = 8 -> 2x engineer
scooters[1] = 2 -> manager
scooters[2] = 4 -> 1x engineer
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
