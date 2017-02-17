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

  #def see_more(input)
    #this method should allow user to navigate to the profile of the beer of their choice based on index, 
    #take input
    #convert index to integer 
    #take that index' profile and navigate to www.beeradvocate.com/#{profile}/// openuri??
  #end



  def menu
    #menu should have two options: search by type or see more of a particular beer OR list again
    #is someone picks searc- they are able to input the type of beer they like and that will return all beers that match that value
    #
    puts "Oh hi...I didn't see you come in. What number of beer would you like to explore?"
    input = gets.strip.to_i

    beer = BeerReview.find_by_index(input.to_i-1)
    
    `open #{"https://www.beeradvocate.com#{beer.profile}"}`

    #while input != "exit"
     #   see_more
      #elsif input == "list"
       # list
      #else 
       # puts "Not sure what you're asking for."
     # end
    #end
  end
end