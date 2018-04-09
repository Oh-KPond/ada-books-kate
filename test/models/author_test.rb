require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  let(:author) { Author.new }
  let(:book_a) { Book.new publication_year: "2000" }
  let(:book_b) { Book.new publication_year: "2001" }
  let(:book_c) { Book.new publication_year: nil }

  describe "first_published" do
    it "should return the yeat of the earliesr published book for the author as an int" do
      # Given
      author.books << book_a

      # When
      # Then
      author.first_published.must_equal 2000
    end

    it "should return nil if the author has 0 books" do

    end
  end

end
