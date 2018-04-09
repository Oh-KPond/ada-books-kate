class Author < ApplicationRecord
  has_many :books

  def first_published
    my_books =
    self.books.order(:publication_year)

    first_book = my_books.first

    return first_book.publication_year
  end
end
