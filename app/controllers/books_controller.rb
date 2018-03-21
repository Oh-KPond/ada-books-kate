class BooksController < ApplicationController
  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
  end

  def create
    @book = Book.new
    @book.title = params[:title]
    @book.author = params[:author]
    @book.description = params[:description]
    @book.save
  end

  def edit
  end

  def update
  end

  def destroy
    id = params[:id]
    @book = Book.find(id)
    @book.destroy
  end

  def index
    @books = Book.all
  end
end
