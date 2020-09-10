#!/usr/bin/env ruby

require_relative '../config/cli.rb'

attrs = {
    name: "NFL", 
    url: "https://www.nfl.com/network/", 
    conferences: ["AFC", "NFC"]
}

nfl = League.new(attrs)

app = Interaction.new(nfl)

