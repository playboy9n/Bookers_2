class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update, :destroy]
	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
		# @book = Book.find(params[:id])
	end
	def index
		@users =User.all
		@user = current_user
		@book = Book.new
	end
	def  edit
		@user = User.find(params[:id])
	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to book_path(book.id)
		else
			render :edit
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		   redirect_to user_path(@user.id),notice: 'You have updated user successfully.'
		else
			render :edit
		end
	end
private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
	def correct_user
		user = User.find(params[:id])
		if current_user  !=  user
		redirect_to books_path
	end
	end
end
