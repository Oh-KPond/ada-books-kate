# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author_list = [
  {
    name: "A Person"
  },
  {
    name: "An Animal"
  },
  {
    name: "Someone"
  }
]

author_list.each do |author|
  worked = Author.create(author)
  puts "#{author[:name]} was ID: #{worked.id}!"
end



book_list = [
  {
    title: "This is a Book",
    description: "description needed",
    author_id: 1
  },
  {
    title: "This is Another Book",
    description: "description needed",
    author_id: 2
  },
  {
    title: "Here, Have Another Book",
    description: "description needed",
    author_id: 3
  }
]

book_list.each do |book|
  worked = Book.create(book)
  puts "#{book[:title]} was ID: #{worked.id}!"
end


genre_list = [
  {name: "Sci-Fi"},
  {name: "Romance"},
  {name: "Non-Fiction"},
  {name: "Fiction"}
]

genre_list.each do |genre|
  worked = Genre.create(genre)
  puts "#{genre[:name]} was ID #{worked.id}"
end
