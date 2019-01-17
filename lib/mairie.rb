#! /usr/bin/env ruby
##****************************************************************************
# RUBY - Recovery of TownHall emails
#*****************************************************************************
#   Ruby's Program - Email Recovery 
#   Written by: Guillaume CHRISTE
# 	Date: Date of modification
#   
#   Description:
# 		- From the website 'http://annuaire-des-mairies.com/val-d-oise.html' we access all cities
# 		- For each city, we recover its email address and store both name & email in an array
# 		
# 	Gems:

require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'
#
#****************************************************************************


#From an url retrieves the email address 

def one_email 
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page_email = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/eaubonne.html"))
    
    emails = []
    page_email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
    email.text
    end
end

#From the url, retrieves the name to each city hall 

def cities
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page_email = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/eaubonne.html"))
    
    cities = []
    page.xpath('//td/p/a').each do |city|
    cities.push(city.text)
    end
end

#From the url, retrieves the urls to each city hall 

def url
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page_email = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/eaubonne.html"))
    
    link = []
    page.xpath('//td/p/a/@href').each do |email|
    link.push(email.text)
    end
    link.each do |replace|
        replace.gsub!('./', 'http://annuaire-des-mairies.com/')
    end
end



#def scrape
#    emails = []
#    i = 0
#    while i < 2000
#        Nokogiri::HTML(open(@link[i]).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
#        emails << email.text
##        i += 1
 #       end
 #   end
#end    