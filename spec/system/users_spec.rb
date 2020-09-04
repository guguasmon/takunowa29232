require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.create(:user)
    OmniAuth.config.mock_auth[:twitter] = nil
    Rails.application.env_config['omniauth.auth'] = twitter_mock
  end

  context 'Twitter認証ができるとき' do 
    it 'ログインボタンを押してユーザーがTwitter認証を許可した時' do
      visit root_path
      expect(page).to_not have_content('マイページ') # ログイン前はマイページという表示が無い
      find_link("ログイン", href: "/auth/twitter").click # ログインボタンをクリックしてTwitter認証を行う
      expect(page).to have_content('マイページ') # リダイレクトされてTOPに戻るとログインできている
    end
  end
  context 'Twitter認証ができないとき' do
    it "ログインボタンを押してユーザーがTwitter認証をキャンセルした時" do
      Rails.application.env_config['omniauth.auth'] = twitter_invalid_mock
      visit root_path
      expect(page).to_not have_content('マイページ') # ログイン前はマイページという表示が無い
      find_link("ログイン", href: "/auth/twitter").click # ログインボタンをクリックしてTwitter認証を行う
      expect(page).to_not have_content('マイページ') # リダイレクトされてTOPに戻るとログインできてない
    end
  end
end
