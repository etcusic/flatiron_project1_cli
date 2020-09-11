#!/usr/bin/env ruby

require 'pry'
require 'open-uri'
require 'nokogiri'
require_relative '../lib/flow_module.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/league_module.rb'
require_relative '../lib/league.rb'
require_relative '../lib/team.rb'
require_relative '../lib/player.rb'


nfl = League.new({name: "NFL", url: "https://www.nfl.com/network/"})

Interaction.new(nfl)