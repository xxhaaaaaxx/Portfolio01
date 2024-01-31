class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
  end

  def edit
    @book = current_user.books.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def update
    book = current_user.books.find(params[:id])
    book.update!(book_params)
    redirect_to books_url
  end

  def create
    book = current_user.books.new(book_params)
    book.save!
    redirect_to books_url, notice: "書籍『#{book.name}』を登録しました。"
  end

  def destroy
    book = current_user.books.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
    def book_params
      params.require(:book).permit(:isbn, :ndc, :name, :auther, :price, :publisher, :published, :notes, :image)
    end
end
