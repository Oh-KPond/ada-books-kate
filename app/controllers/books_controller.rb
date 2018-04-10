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
    @book = Book.new(book_params)
    # book.title = params[:book][:title]
    # book.author = params[:book][:author]
    # book.description = params[:book][:description]

    if @book.save # it worked!
      flash[:success] = "Book added successfully"
      redirect_to books_path
    else
      flash.now[:alert] = @book.errors
      render :new
    end

  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(book_params)
    # book.title = params[:book][:title]
    # book.author_id = params[:book][:author_id]
    # book.description = params[:book][:description]

    if @book.save
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
    @book = Book.find(id)
    @book.destroy
  end

  def index
    @user = User.find_by(id: session[:user_id])
    # author_id = params[:author_id]
    if params[:author_id]
      author = Author.find_by(id: params[:author_id])
      @books = author.books
    else
      @books = Book.all
    end
  end

  private

  def book_params
    return params.require(:book).permit(:title, :author_id, :description, genre_ids: [])
  end

end
