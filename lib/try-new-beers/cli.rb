class TryNewBeers::CLI

  def call
    list_beers
    menu
    goodbye
  end

  def list_beers
    puts "Here are the 25 latest beer reviews:"
    puts <<-DOC
    1. Doghead - IPA - Avg Review:4.25
    2. FunnyBone - Lager - Avg Review: 3.75
    3. XYZ - Pale Ale - Avg Review: 4.15
    DOC
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
        puts "list_beers"
      else 
        puts "Not sure what you're asking for."
      end
    end
  end
end