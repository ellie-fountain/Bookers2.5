class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  	@users = User.all
  	@user = current_user
  	@book =Book.new
  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
    @books = @user.books.all

  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(book)
    else
      render :index
    end
  end

  def edit
  	@user = User.find(params[:id])
     unless @user.id == current_user.id
     redirect_to user_path(@current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
private 
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end
end
