require 'pry'
class TryNewBeers::CLI

  #Greet the user - show picture for cheer (beer mug)...loading .....
  #Retrieve reviews
  #Instruct on browsing or searching- it should list all the beers from 1 - 250 
  # give the option to search by type
  # take input and return beer types
  #

   def call
    list_reviews
    menu
  end

  puts

  "**********************
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


  .....loading....."


  def list
    puts ""
    BeerReview.all.each.with_index(1) do |b, i|
      puts "#{i}. #{b.name}, #{b.type}, #{b.brewery}, #{b.rating}, https://www.beeradvocate.com#{b.profile}"
    end
    puts""
  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you'd like to learn more about"
      input = gets.strip.downcase

      if input.to_i > 0
        review = @beer_review[input.to_i-1]
        puts "#{review.name} - #{review.brewery} - #{review.type} - #{review.rating}"
      elsif input == "list"
        list_reviews
      else 
        puts "Not sure what you're asking for."
      end
    end
  end
end