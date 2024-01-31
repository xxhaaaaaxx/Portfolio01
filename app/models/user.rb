class User < ApplicationRecord
    has_secure_password
    has_many :books
    # 一対多の多のほう

    has_many :book_comments, dependent: :destroy
    # Userモデル、Bookモデルのインスタンスは複数のBookCommentモデルのインスタンスと関連付けられる
    # dependent: :destroyオプションによって、UserやBookが削除された場合に関連するBookCommentも同時に削除される

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    # バリデーション

end
