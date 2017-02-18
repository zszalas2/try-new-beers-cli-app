class BeerReview
  attr_accessor :name, :brewery, :type, :rating, :profile, :doc


  @@all = []

  
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  #def self.find_by_type(type)
    #create an array match_beers, this will serve as a bucket for matches
    #Each method - iterate over every element to see if inout is included
    #compare type by using substring. if type.substring == input.substring 
    #if comparison is true/ -1 < input/ then save into bucket
    #return the matches in with index form and allow to explore further by open
    #self.all.detect do |t|
      #t.type.include?(type)
      #binding.pry
    #end
  #end

  def self.find_by_index(index)
    self.all[index-1]
  end

  def self.names
    @names ||= @doc.search("tr a b").collect {|e| e.text}
  end

  def self.types
    @types ||= @doc.search("div#extendedInfo a").children.select.each_with_index { |children, i| i.odd? }.collect {|e| e.text}
  end

  def self.breweries
    @breweries ||= @doc.search("div#extendedInfo a").children.select.each_with_index { |children, i| i.even? }.collect {|e| e.text}
  end
    

  def self.ratings
    @ratings ||= @doc.search("td[align='left'][valign='top'].hr_bottom_light b").collect {|e| e.text}
  end

  def self.profiles
    @profiles ||= @doc.search("tr td a").collect {|link| link.attribute('href').value}
  end


  def self.get_page
    @doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
  end

  def self.scrape_all
    self.get_page
    beer_review_array = names.zip(types, breweries, ratings, profiles)
    
    (0..beer_review_array.size-1).to_a.each_with_index do |i|
      beer_review.name = beer_review_array[i][0]
      beer_review.type = beer_review_array[i][1]
      beer_review.brewery = beer_review_array[i][2]
      beer_review.rating = beer_review_array[i][3].to_f
      beer_review.profile = beer_review_array[i][4]
      beer_review.save
    end
  end
end

