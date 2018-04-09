class Author < ApplicationRecord
  has_many :books

  def first_published
    books_with_publication_date =
    self.books.where.not(publication_year: nil)

    sorted_books =
    books_with_publication_date.order(publication_year: asc)

    if sorted_books.empty?
      return "NO BOOKS"
    end

    first_book = sorted_books.first

    return first_book.publication_year.to_i
  end
end
