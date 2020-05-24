class BookCommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@book = Book.find(params[:book_id])
		# 下記記2つの記述はbook_comment = current_user.book_comments.new(book_comment_params)の記述でまとめられる。
		@book_comment = BookComment.new(book_comment_params)
		@book_comment.user_id = current_user.id
		# book_commentsテーブルにしまうbook_idの取得。コメントをする本のID＝本のID(一番上の記述でbookは取得済み。その中のID。)
		@book_comment.book_id = @book.id
		# コメントの保存
		@book_comment.save
		# 元のページへ遷移
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@book = Book.find(params[:book_id])
		book_comment = @book.book_comments.find(params[:id])
		book_comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end
end
