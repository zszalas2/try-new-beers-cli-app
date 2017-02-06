class BeerReview
  attr_accessor :name, :brewery, :type, :rating, :profile :doc


  @@all = []

  def initialize (name=nil, brewery=nil, type=nil, rating=nil, profile=nil)
    @name = name
    @brewery = brewery
    @type = type
    @rating = rating
    @profile = profile
  end

  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

  def self.find_by_index
    #search function to find elements based on index
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
    BeerReview.new
    names.zip(types, breweries, ratings, profiles).each do |i|
      name = [i][0]
      type = [i][1]
      brewery = [i][2]
      ratings = [i][3]
      profile = [i][4]
    end
    BeerReview.save
    binding.pry
    #the above method maps corresponding elements together fromt he different arrays.
    


  end
end

