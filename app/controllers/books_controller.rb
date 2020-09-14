class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
  	@books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    # http://localhost:3000/books/1
  	@book = Book.find(params[:id])
    @user = @book.user
    @Book = Book.new
    # params[:id] = 1
    #<Book id: 1, title: "aiueo", body: "kakikukeko", created_at: "2020-08-25 09:05:31", updated_at: "2020-08-25 09:05:31">
  end


  def create
    @user = current_user
    @books = Book.all
  	@book = Book.new(book_params)
    @book.user = current_user
  	if@book.save
  	 redirect_to book_path(@book.id), notice:'Book was successfully created'
    else
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @user = current_user
    @book = Book.find(params[:id])
    @book.user = current_user
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice:'Book was successfully created'
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

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
    end

end
