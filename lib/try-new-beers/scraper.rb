class TryNewBeers::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.beeradvocate.com/beer/"))
  end

  def scrape_page
  end

  def make_reviews
  end

end

#Scraper object
#scrape site for beer reviews
#instantiate a new beer_list which is made up of beer reviews review object 
# => name of beer
# => type of beer
# => name of brewery
# => Acl Content
# => avg stars
# => descriptiom
# => beer profile page
#have the ability to navigate to the beer profile page