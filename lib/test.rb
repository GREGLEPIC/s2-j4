require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/HTML'))
page.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr[2]/th/a').each do |el|
   puts el.text
end


#mw-content-text > div > table.infobox > tbody > tr:nth-child(8) > th
#mw-content-text > div > table.infobox > tbody > tr:nth-child(9) > th
