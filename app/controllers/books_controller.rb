class BooksController < ApplicationController
  before_action :authenticate_user!, except: :top
  before_action :correct_book, only: [:edit, :update]
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
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have creatad book successfully.'
    else
      @books = Book.all.order(created_at: :desc)
      @user = current_user
      render :index
    end

  end
  def update
    @book = Book.find(params[:id])
    if  @book.update(books_params)
        redirect_to book_path(@book.id),notice: 'You have  updated book successfully.'

    else
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def books_params
  params.require(:book).permit(:title, :body)
  end
  def correct_book
    book = Book.find(params[:id])
    if current_user  != book.user
      redirect_to books_path
    else
    end
  end
end