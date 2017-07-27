![](https://travis-ci.org/Leopard2A5/scooter-maintenance.svg?branch=master)

# Scooters

This is a tool to help determine the required number of engineers to maintain a fleet of scooters.

## Installation

After checking out the repository, install the gem locally with
```bash
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

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
