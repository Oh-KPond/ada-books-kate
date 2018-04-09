require 'test_helper'

class BookTest < ActiveSupport::TestCase

  describe Book do
    let(:book) {Book.new title: "Wizard of Oz", author_id: (Author.create name: "Kari B").id }

    it "must be valid" do
      value(book).must_be :valid?
    end

    it "must have a title" do

      book.title = nil

      book.valid?.must_equal false
      book.errors.must_include :title
    end

    it "title must be more than 1 character, and less than 25 characters" do

      book.title = ""
      book.valid?.must_equal false

      book.title = "99999999999999999999999999"
      book.valid?.must_equal false
    end

    it "must have an author" do
      author = Author.create name: "Kari B"

      book.author = author

      # see let statement above to see author.id
      book.author_id.must_equal author.id
    end

    it "must have a genre field" do

      book.genres.must_equal []
      book.genres << Genre.create(name: "Sci Fi")

      genre = Genre.find_by name: "Sci Fi"

      book.genres.must_include genre
    end
    
  # below uses fixtures
    describe 'relations' do
      it "has an author" do
        book = books(:poodr)
        book.author.must_equal authors(:metz)
      end

      it "can set the author" do
        book = Book.new(title: "test book")
        book.author = authors(:metz)
        book.author_id.must_equal authors(:metz).id
      end
    end

  end
end
