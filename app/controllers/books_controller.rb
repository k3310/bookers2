class BooksController < ApplicationController
  def create
    @book = Book.new(book_params) 
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
  end

  def destroy
    book = book.find(params[:id])
    book.destroy
    redirect_to books_path
  end




  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
