# If you forget to call .each on a collection or hash, and define a do block after it, the compiler won't warn you - it will just ignore the do block!
# If you write do, you want an each before it!

class MovieCatalog

  def initialize (movies)
    @movies = movies
  end

  def exists(title)
    return !@movies[title].nil?
  end

  def get(title)
    return @movies[title]
  end

  def getAll()
    return @movies
  end

  def add (title, rating)
    @movies[title] = rating
  end

  def update (title, rating)
    @movies[title] = rating
  end

  def delete (title)
    @movies.delete(title)
  end

  def display ()
    @movies.each do | title, rating |
    puts "#{title}: #{rating}"
  end
  
end

# movies = {
#   HarryPotter: 4.8, 
#   Labrynth: 4.7
# }

movies = {
  :HarryPotter => 4.8, 
  :Labrynth => 4.7
}

catalog = MovieCatalog.new(movies)

puts "What would you like to do? "

choice = gets.chomp

while choice != "" do

  case choice
  when "add"
    puts "What movie would you like to add? "
    title = gets.chomp.to_sym
    if !catalog.exists(title)
      puts "What rating does the movie have? "
      rating = gets.chomp.to_i
      catalog.add(title, rating)
      puts "#{title} has been added with a rating of #{rating}."
    else
      puts "That movie already exists! It's rating is #{catalog.get(title).rating}"
    end
  when "update"
    puts "what title?"
    title = gets.chomp.to_sym
    if !catalog.exists(title)
      puts "there is an error"
    else
      puts "we need to update the rating"
      rating = gets.chomp.to_i
      catalog.update(title, rating)
    end
  when "display"
    catalog.getAll().each do | title, rating |
      puts "#{title}: #{rating}"  
    end
  when "delete"
    puts "what movie to delete?"
    title = gets.chomp.to_sym
    if !catalog.exists(title)
      puts "movie not there"
    else 
      puts catalog.delete(title)
    end
  end

  puts "What would you like to do? "

  choice = gets.chomp

end
end