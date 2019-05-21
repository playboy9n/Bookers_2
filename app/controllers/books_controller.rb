class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @bookn = Book.new
    @user = @book.user

  end

  def index
    @books = Book.all.order(created_at: :desc)
    @user = current_user
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  def update
    book = Book.find(params[:id])
    book.update(books_params)
    redirect_to book_path(book.id)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to
  end
  private
  def books_params
  params.require(:book).permit(:title, :body)
  end
end