require 'scraperwiki'
require 'nokogiri'

#ALLE 579 TABELLENSEITEN EINLESEN
for page in 1..2 #80
  
  #EINZELNE TABELLESEITE EINLESEN
  html = ScraperWiki::scrape("https://www.berlin.de/special/finanzen-und-recht/adressen/geldautomat/?trpg=#{page}")
  doc = Nokogiri::XML(html)    

  counter = 0
     
    #LAND
    doc.css('p.address').each do |row|
          bank = row.content[0]
          puts bank
          ScraperWiki::save_sqlite([:Bank], data={'Bank'=>bank}, table_name='Berliner Geldautomaten')          
    end

    sleep 2
end