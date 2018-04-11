class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find_by(id: params[:id])
  end

  def edit
    @author = Author.find_by(id: params[:id])
  end

  def update
    author = Author.find_by(id: params[:id])
    author.update(author_params)
    flash[:success] = "#{author.name} updated"
    redirect_to author_path(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    if @author.id != nil
      flash[:success] = "Author Created"
      redirect_to authors_path
    else

       flash.now[:alert] = @author.errors
       render :new
    end
  end

  def destroy
    @author = Author.find_by(id: params[:id])

    if @author
      @author.books.each do |book|
        book.destroy
      end
      @author.destroy
        flash[:success] = "#{@author.name} deleted"
        redirect_back fallback_location: :authors_path
    else
      flash[:alert] = "Author does not exist"
      redirect_back fallback_location: :authors_path
    end
  end

  private
  def author_params
    return params.require(:author).permit(:name, :id)
  end

  def find_author
    @author = Author.find_by(id: params[:author_id])
  end
end
