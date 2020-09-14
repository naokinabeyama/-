class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
    @user = current_user
    @users = User.all
    @user = User.new(user_params)
    if @user.save
     redirect_to user_path(@user.id), notice:'Book was successfully created'
    else
      render :edit
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
  	redirect_to user_path(@user.id), notice:'Book was successfully created'
    else
      render :edit
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out successfully'
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

    def correct_user
    user = User.find(params[:id])
    @user = current_user
    if current_user != user
      redirect_to user_path(@user.id)
    end
    end

end
