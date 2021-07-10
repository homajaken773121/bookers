class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save   # データ（レコード）を削除
      redirect_to book_path(@book.id), notice: "Book was successfully created." # 投稿一覧画面へリダイレクト
    else
      render :new
     # redirect_to books_path, alert: "Create was failed" # 投稿一覧画面へリダイレクト
    end
  end
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)  # データ（レコード）を削除
      redirect_to book_path(@book.id), notice: "Book was successfully updated." # 投稿一覧画面へリダイレクト
    else
      render :new
      #redirect_to books_path, alert: "Update was failed" # 投稿一覧画面へリダイレクト
    end
  end
  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    if @book.destroy   # データ（レコード）を削除
      redirect_to books_path, notice: "Book was successfully destroyed." # 投稿一覧画面へリダイレクト
    else
      render :new
      #redirect_to books_path, alert: "Destroy was failed" # 投稿一覧画面へリダイレクト
    end
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def succsess_or_not
    true
  end

end
