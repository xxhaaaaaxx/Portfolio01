class Book < ApplicationRecord
    belongs_to :user
    # 一対多の一のほう

    has_many :book_comments, dependent: :destroy
    # Userモデル、Bookモデルのインスタンスは複数のBookCommentモデルのインスタンスと関連付けられる
    # dependent: :destroyオプションによって、UserやBookが削除された場合に関連するBookCommentも同時に削除される

    has_one_attached :image
    # ActiveStorageを紐付け
end
