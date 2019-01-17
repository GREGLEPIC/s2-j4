require 'rspec'
require 'pry'
require 'nokogiri'
require 'open-uri'


    @page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    @page_email = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/eaubonne.html"))



def one_email
    emails = []
    @page_email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
    email.text
    end
end


def cities
    cities = []
    @page.xpath('//td/p/a').each do |city|
    cities.push(city.text)
    end
end


def url
    @url = []
    @page.xpath('//td/p/a/@href').each do |email|
    url.push(email.text)
    end
    url.each do |replace|
        replace.gsub!('./', 'http://annuaire-des-mairies.com/')
    end
end



def scrape
    emails = []
    n = url.count
    i = 0
    while i < n
    page_multi_email = Nokogiri::HTML(open("#{@url[i]}"))
    page_multi_email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
    emails << email.text
    end
    puts emails 
    i += 1
    end
end

p scrape