<a href="https://codeclimate.com/github/andela-oosiname/mastermind_sname"><img src="https://codeclimate.com/github/andela-oosiname/mastermind_sname/badges/gpa.svg" /></a>
[![Build Status](https://travis-ci.org/andela-oosiname/mastermind_sname.svg)](https://travis-ci.org/andela-oosiname/mastermind_sname)
<a href="https://codeclimate.com/github/andela-oosiname/mastermind_sname/coverage"><img src="https://codeclimate.com/github/andela-oosiname/mastermind_sname/badges/coverage.svg" /></a>
# MastermindSname

Welcome to Mastermind by sname. An interactive gem packaged and played in a ruby environment. 

## Installation

The User should have ruby set on his pc

Add this line to your application's Gemfile:

```rub
gem 'mastermind_sname'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mastermind_sname

## Usage

A splash screen is showed once a game is started from where the user can start a game or read instructions.

A random code of varying legth is generated depending on the level  selected by the user.

You have twelve guesses per game.

On every guess, you are presented with a message identifying the number of elements you got correctly, and in what positions.

To view entry history, enter h or history at any time.
To view sequence generated, enter c or cheat at any time
To quit the game at any point enter q or quit.

The game is timed and on successful completion, the user gets a detail of his performance and a top players list is displayed


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/andela-oosiname/mastermind_sname/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
