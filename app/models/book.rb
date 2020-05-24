class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	# 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べます。存在していればtrue、存在していなければfalseを返すようにしています。
	# ユーザーは一つの投稿に一つしかいいねできない。という機能にするため。

	has_many :book_comments, dependent: :destroy

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
