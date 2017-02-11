class BeerReview
  attr_accessor :name, :brewery, :type, :rating, :profile, :doc


  @@all = []

  #def initialize (name=nil, brewery=nil, type=nil, rating=nil, profile=nil)
    #@name = name
    #@brewery = brewery
    #@type = type
    #@rating = rating
    #@profile = profile
  #end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_type(input)
    #search function to find elements based on index
    #user inputs a number
    self.all.select do |type| 
      input == beer_review.type
    end
  end

  def self.find_by_brewery(brew)
    #this search function would allow people to search based on their favorite brewery
    #this would require a user input 
    #self.all.find_all do |b|
      #b.brewery.downcase.strip == brewery.downcase.strip ||
      #b.brewery.split("(").first.strip.downcase == brewery.downcase.strip
  end

  def self.names
    #extract name
    names ||= @doc.search("tr a b").collect {|e| e.text}
  end

  def self.types
    #extract type and brewery
    types ||= @doc.search("div#extendedInfo a").children.select.each_with_index { |children, i| i.odd? }.collect {|e| e.text}
  end

  def self.breweries
    #I need this to return to me an array with the strings of all the breweries. Because the span for type and brewery are both children of the same,
    #I have to use even? or odd? on the arra
    breweries ||= @doc.search("div#extendedInfo a").children.select.each_with_index { |children, i| i.even? }.collect {|e| e.text}
  end
    

  def self.ratings
    ratings ||= @doc.search("td[align='left'][valign='top'].hr_bottom_light b").collect {|e| e.text}
  end

  def self.profiles
    #I need this code to return the url extension and then attache the extension on the end of every url (last part can be done under scrape_all )
    profiles ||= @doc.search("tr td a").collect {|link| link.attribute('href').value}
  end


  def self.get_page
    @doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    #name = doc.search("tr a b").each do |n| puts n.text end
    #type_and_brewing_company = @doc.search("div#extendedInfo").children.each do |row| puts row.children.first end
  end

  def self.scrape_all
    beer_review_array = names.zip(types, breweries, ratings, profiles)
    
    (0..beer_review_array.size).to_a.each_with_index do |i| #0..bra.size returns 250. Convert to an array, returning an array of integers from 0 - 250. Each_index will iterate over every single integer. Using i as a variable for every integer
      beer_review = BeerReview.new
      beer_review.name = beer_review_array[i][0]
      beer_review.type = beer_review_array[i][1]
      beer_review.brewery = beer_review_array[i][2]
      beer_review.rating = beer_review_array[i][3]
      beer_review.profile = beer_review_array[i][4]
      beer_review.save
    end
  end
end

