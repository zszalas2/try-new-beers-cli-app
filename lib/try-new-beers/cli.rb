require 'pry'
class TryNewBeers::CLI


  def call

        puts""

    puts "
    **********************
    **********************
    **********************
    **********************
    ********************************
    ********************************
    **********************       ***
    *******CHEERS*********       ***
    **********************       ***
    **********************       ***
    **********************       ***
    **********************       ***
    ********************************
    ********************************
    **********************
    **********************
    **********************

    Welcome to Cheers: Try New Beers



    .....loading....."
    puts ""

    BeerReview.scrape_all 
    list
    puts "Loading Menu ................................. " 
    menu
  end


  def list
    puts "Here are 250 beers you can try!"
    BeerReview.all.each.with_index(1) do |b, i|
      puts "#{i}. #{b.name}, #{b.type}, #{b.brewery}, #{b.rating}, https://www.beeradvocate.com#{b.profile}"
    end
  end


  def menu
    puts "Hi there... didn't see you come in. Insert the number of the beer would you like to explore?"
    input = gets.strip.to_i

      beer = BeerReview.find_by_index(input.to_i-1)
      `open #{"https://www.beeradvocate.com#{beer.profile}"}`

    end
  end
end