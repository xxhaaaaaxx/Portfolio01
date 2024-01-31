class BookCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        comment = current_user.book_comments.new(book_comment_params)
        comment.book_id = book.id
        comment.save!
        redirect_to request.referer
      end
      # URLのbook_idから関連する本を見つける
      # 次に、現在のユーザーによる新しいコメントを作成
      # comment.book_id = book.idで作成したコメントに関連する本のIDを設定・保存
      # リクエスト元のページにリダイレクト

      # saveとsave!の違い
      # saveは、バリデーションに失敗するとfalseを返す
      # save!は、バリデーションに失敗するとActiveRecord::RecordInvalidという例外を発生させる
      # save!はエラーを厳しくチェックするバージョンのsaveだと言える

      
      def destroy
        comment = BookComment.find(params[:id])
        comment.destroy
        redirect_to request.referer
      end
      # 与えられたコメントのIDを使用し、対応するコメントを見つけて削除
      # リクエスト元のページにリダイレクト
      
      private
      
      def book_comment_params
        params.require(:book_comment).permit(:comment)
      end
      # ストロングパラメータ

end
