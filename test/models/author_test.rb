require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  let(:author) { Author.new }

  describe "first_published" do
    it "should return the yeat of the earliesr published book for the author as an int" do

    end

    it "should return nol if the author has 0 books" do

    end
  end
  
end
