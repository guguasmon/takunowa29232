class SessionsController < ApplicationController
  def create
    raise "request.env[omniauth.auth]がありません" if auth_params.nil?
    user = User.find_or_create_from_auth_hash(auth_params)
    if user
      log_in(user)
      flash[:notice] = 'ログインしました'
      redirect_to root_path
    else
      flash[:danger] = '失敗しました'
      redirect_to root_path
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end

  # callbackに失敗したときに呼ばれるアクション
  def failure
    redirect_to root_path
  end

  private
  # ユーザー情報の入った
  #request.env['omniauth.auth']はTwitter認証で得た情報を格納するもの
  def auth_params
    request.env["omniauth.auth"]
  end

end
