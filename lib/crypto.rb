#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Obscur Trader
#****************************************************************************
#   Ruby's Program - obscur_trader
#   Written by: Greg Rouxel Oldrà
# 	Date: 17-Jan-
#   
#   Description:
# 		- From an HTML Page we recover the name of the Cryptomoney Symbol & it's price
# 		- Each item is stored in a dedicated array then merged (zip) in a hash
# 		 
# 	Gems:

require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'

#
#****************************************************************************

def array_crypto

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
puts page.class   # => Nokogiri::HTML::Document

    crypto_name = []
         page.xpath('//td[3]').each do |name|
         crypto_name << name.text
         end


    crypto_value = []
       page.css('td:nth-child(5) a').each do |value|
       crypto_value << value.text
       end

    crypto_scrap = crypto_name.map.with_index do |name, index|
        crypto_hash = {}
        crypto_hash[name] = crypto_value[index]
        crypto_hash
        end
    
    return crypto_scrap
end

# End of obscur_trader .......................................................
#.............................................................................
#.............................................................................

p array_crypto

