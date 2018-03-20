class BooksController < ApplicationController
  def show
    id = params[:id]
    @book = Book.find(id)
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

  def index
    @books = Book.all
  end
end
