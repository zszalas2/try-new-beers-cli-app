require 'pry'
class TryNewBeers::CLI

  


  #Greet the user - show picture for cheer (beer mug)...loading .....
  #Retrieve reviews
  #Instruct on browsing or searching- it should list all the beers from 1 - 250 
  # give the option to search by type
  # take input and return beer type


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

  #def print_beer_review
    #this should print out all the beers that are a certain type
    #beer = BeerReview.find_by_type(input)
    #puts ""
    #puts "#{i}. #{b.name}, #{b.type}, #{b.brewery}, #{b.rating}, https://www.beeradvocate.com#{beer.profile}"
  #end

  #def see_more(input)
    #this method should allow user to navigate to the profile of the beer of their choice based on index, 
    #take input
    #convert index to integer 
    #take that index' profile and navigate to www.beeradvocate.com/#{profile}/// openuri??
  #end



  def menu
    #menu should have two options: search by type or see more of a particular beer OR list again
    #is someone picks searc- they are able to input the type of beer they like and that will return all beers that match that value
    puts "Hi there... didn't see you come in. Insert the number of the beer would you like to explore?"
    input = gets.strip.to_i

    #if input == "type"
      #puts "What type of beer would you like to explore?"
      #input = gets.strip.downcase
      #BeerReview.find_by_type(input)

      beer = BeerReview.find_by_index(input.to_i-1)
      `open #{"https://www.beeradvocate.com#{beer.profile}"}`

    if input == list
      list        
    else puts "I don't know what you want. Either input 'number' to search by beer number, 'type' to search by beer type, 'list' to see the list of beers, or 'exit' to quit."
      input 
     #   see_more
      #elsif input == "list"
       # list
      #else 
       # puts "Not sure what you're asking for."
     # end
    end
  end
end