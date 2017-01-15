class BooksController < ApplicationController
  before_action :set_book, only: [:show, :destroy]
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
    @book = Book.new
  end

  def create
    # your code here
    @book = Book.create(book_params)
    if @book.save
      redirect_to books_url
    end
  end

  def destroy
    # your code here
    @book.destroy
    redirect_to books_url
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:id, :title, :author)
  end
end
