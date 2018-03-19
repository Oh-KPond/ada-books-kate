class BooksController < ApplicationController
  def show
    id = params[:id]
    @book = BOOKS_LIST.find do |book|
      book[:id] == id.to_i
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
BOOKS_LIST = [
  {id: 1, title: "1984", author: "George Orwell"},
  {id: 2, title: "Pride and Prejudice", author: "Jane Austin"},
  {id: 3, title: "Some book", author: "An Author"},
  {id: 4, title: "Another Book", author: "Another Author"}
]

  def index
    @books = BOOKS_LIST
  end
end
