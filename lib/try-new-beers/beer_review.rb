class TryNewBeers::BeerReview
  attr_accessor :name, :brewery, :type, :rating, :profile

  def self.recent
    #should return 25 instances of the  most recent beer_reviews
    #scrape https://www.beeradvocate.com/beer/ and return all recent instances of reviews 
    self.scrape_reviews
  def self.scrape_reviews
  end

    beer_review_1 = self.new
    beer_review_1.name = "Doghead"
    beer_review_1.brewery = "Doghead Brewery"
    beer_review_1.type = "IPA"
    beer_review_1.rating = "Avg Rating:4.25"
    beer_review_1.profile = "www.beer.com"

    beer_review_2 = self.new
    beer_review_2.name = "Funnybone"
    beer_review_2.brewery = "Dingleberry Brewery"
    beer_review_2.type = "Lager"
    beer_review_2.rating = "Avg Rating:3.75"
    beer_review_2.profile = "www.beer.com"

    [beer_review_1, beer_review_2]
  end

end