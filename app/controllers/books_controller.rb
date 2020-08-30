class BooksController < ApplicationController

  def index
  	@books = Book.all
    @book = Book.new
  end

  def show
    # http://localhost:3000/books/1
  	@book = Book.find(params[:id])
    # params[:id] = 1
    #<Book id: 1, title: "aiueo", body: "kakikukeko", created_at: "2020-08-25 09:05:31", updated_at: "2020-08-25 09:05:31">
  end

  def new
    #<Book id: nil, title: nil, body: nil, created_at: nil, updated_at: nil>
  end

  def create
    @books = Book.all
  	@book = Book.new(book_params)
  	if @book.save
  	 redirect_to book_path(@book.id), notice:'Book was successfully created'
    else
      render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
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
end
