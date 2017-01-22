require 'pry'
class TryNewBeers::CLI



  def call
    list_reviews
    menu
  end

  def list_reviews
    puts "Here are the 25 latest beer reviews:"
    @beer_review = TryNewBeers::BeerReview.recent
  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you'd like to learn more about"
      input = gets.strip.downcase
      case input 
      when "1"
        puts "Great choice! Here's some more info"
      when "2"
        puts "Great choice! Here's some more info"
      when "3"
        puts "Great choice! Here's some more info"
      when "list"
        list_reviews
      when "exit"
        exit
      else 
        puts "Not sure what you're asking for."
      end
    end
  end
end