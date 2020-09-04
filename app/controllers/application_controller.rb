class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  # ログイン済みユーザーかどうか確認 before_Actionに設定することでログインしてなかったらトップへ戻す
  def logged_in_user
    redirect_to root_path unless logged_in?
  end
end
