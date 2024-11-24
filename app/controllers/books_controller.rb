class BooksController < ApplicationController
  def create
    @book = Book.new(book_params) 
    @book.user.id = current_user.id
    @book.save
    redirect_to book_path

  def index
  end

  def show
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
