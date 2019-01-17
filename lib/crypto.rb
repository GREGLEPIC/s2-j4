# My require 
require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'


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

p array_crypto

