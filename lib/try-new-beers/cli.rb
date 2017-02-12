require 'pry'
class TryNewBeers::CLI

  


  #Greet the user - show picture for cheer (beer mug)...loading .....
  #Retrieve reviews
  #Instruct on browsing or searching- it should list all the beers from 1 - 250 
  # give the option to search by type
  # take input and return beer types
  #

   def call
    BeerReview.scrape_all #prime
    list
    menu
  end


  def starts

  
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


    .....loading.....

    Welcome to Cheers: Try New Beers"
  end


  def list
    puts "Here are the top 250 beers!"
    puts ""
    BeerReview.all.each.with_index(1) do |b, i|
      puts "#{i}. #{b.name}, #{b.type}, #{b.brewery}, #{b.rating}, https://www.beeradvocate.com#{b.profile}"
    end
    puts""
  end

  def see_more
    #this method should allow user to navigate to the profile of the beer of their choice based on index, 
    #take input
    #convert index to integer 
    #take that index' profile and navigate to www.beeradvocate.com/#{profile}
  end



  def menu
    #menu should have two options: search by type or see more of a particular beer
    #is someone picks searc- they are able to input the type of beer they like and that will return all beers that match that value
    #
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