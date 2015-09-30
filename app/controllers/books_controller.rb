class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @books = Book.all.page(params[:page]).per(2)
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id]) 
  end

  def home
  	#@books = Book.last(3)
  end
end
