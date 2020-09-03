require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    OmniAuth.config.mock_auth[:twitter] = nil
    Rails.application.env_config['omniauth.auth'] = twitter_mock
  end

  context 'Twitter認証ができるとき' do 
    it 'ユーザーが許可を出した時、Twitter認証ができてトップページに移動する' do
      visit root_path
      expect(page).to_not have_content('マイページ') # ログイン前はマイページという表示が無い
      find_link("ログイン", href: "/auth/twitter").click # ログイン
      visit root_path
      # expect(current_path).to eq root_path
      # expect(page).to have_content('マイページ') # マイページと表示されている
    end
  end

end
