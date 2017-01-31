class TryNewBeers::BeerReview
  attr_accessor :name, :brewery, :type, :rating, :profile


  @@all = []

  def initialize (name=nil, brewery=nil, stype=nil, rating=nil)
    @name = name
    @brewery = brewery
    @type = type
    @rating = rating
    @proile = proile
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_index
    #search function to find elements based on index
  end

  def self.name
    #extract name
    @name ||= @doc.search("tr a b").collect {|e| e.text}
  end

  def self.type
    #extract type and brewery
    @type ||= @doc.search("div#extendedInfo a").children.select.each_with_index { |children, i| i.odd? }.collect {|e| e.text}
  end

  def self.brewery
    #I need this to return to me an array with the strings of all the breweries. Because the span for type and brewery are both children of the same,
    #I have to use even? or odd? on the arra
    @brewery ||= @doc.search("div#extendedInfo a").children.select.each_with_index { |children, i| i.even? }.collect {|e| e.text}
  end
    

  def self.rating
    @rating ||= @doc.search("td[align='left'][valign='top'].hr_bottom_light b").collect {|e| e.text}
  end

  def self.profile
    #I need this code to return the url extension and then attache the extension on the end of every url (last part can be done under scrape_all )
    @doc.search("tr td a").collect {|link| link.attribute('href').value}
  end


  def self.get_page
    @doc = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/top/"))
    #name = doc.search("tr a b").each do |n| puts n.text end
    #type_and_brewing_company = @doc.search("div#extendedInfo").children.each do |row| puts row.children.first end
    binding.pry
  end

  def self.scrape_all
    #scrape each row and put into an array.
  #scrape a row instead of scraping a column- scrape row, extract name, type, brewery, and push into on array.
  end
end

