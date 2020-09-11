#!/usr/bin/env ruby
require_relative '../config/cli.rb'

nfl = League.new({name: "NFL", url: "https://www.nfl.com/network/"})

Interaction.new(nfl)

