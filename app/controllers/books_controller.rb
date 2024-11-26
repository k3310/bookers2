class BooksController < ApplicationController
  def create
    @book = Book.new(book_params) 
    @book.user.id = current_user.id
    if @book.save
      redirect_to book_path
    else
      render :index

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
