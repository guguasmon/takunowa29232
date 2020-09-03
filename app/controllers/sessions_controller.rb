class SessionsController < ApplicationController
  def create
    raise "request.env[omniauth.auth]がありません" if auth_params.nil?
    user = User.find_or_create_from_auth_hash(auth_params)
    if user
      session[:uid] = user.uid
      binding.pry
      redirect_to root_path, notice: "ログインしました。"
    else
      redirect_to root_path, notice: "失敗しました。"
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました'
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

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:uid] = user.uid
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_user
    if session[:uid]
      @current_user ||= User.find_by(uid: session[:uid])
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:uid)
    @current_user = nil
  end
end
