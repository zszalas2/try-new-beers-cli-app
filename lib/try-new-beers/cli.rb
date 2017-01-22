require 'pry'
class TryNewBeers::CLI



  def call
    list_reviews
    menu
  end

  def list_reviews
    puts "Here are the 25 latest beer reviews:"
    @beer_review = TryNewBeers::BeerReview.recent
    @beer_review.each.with_index(1) do |r, i|
      puts "#{i}. #{r.name} - #{r.brewery} - #{r.type} - #{r.rating}"
    end
  end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the beer you'd like to learn more about"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @beer_review[input.to_i-1]
      elsif input == "list"
        list_reviews
      else 
        puts "Not sure what you're asking for."
      end
    end
  end
end