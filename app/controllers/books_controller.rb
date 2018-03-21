class BooksController < ApplicationController
  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
    #creates a blank book object
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
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
