class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  # ログイン済みユーザーかどうか確認 before_Actionに設定することでログインしてなかったらトップへ戻す
   def logged_in_user
     unless logged_in?
       redirect_to root_path
     end
   end

end
