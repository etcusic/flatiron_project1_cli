#!/usr/bin/env ruby
# ruby executable.rb
require_relative '../config/cli.rb'
# require 'nokogiri'

# teams = []

# x = Nokogiri::HTML(open("https://www.nfl.com/network/")).css("ul.d3-o-footer__panel-links").each do |tag|
#         tag.css('li a').each do |a|
#             hash = {}
#             hash[:name] = a.attribute('data-link_name').value
#             hash[:division] = tag.text.strip
#             hash[:roster_url] = a.attribute('href').value + "team/players-roster/"
#             teams << hash
#     end
#     binding.pry
# end

# attrs = {
#     name: "NFL", 
#     url: "https://www.nfl.com/network/"
# }

# nfl = League.new(attrs)

# app = 

nfl = League.new({name: "NFL", url: "https://www.nfl.com/network/"})

Interaction.new(nfl)
