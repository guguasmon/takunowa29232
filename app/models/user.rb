class User < ApplicationRecord
  has_many :user_event_relations
  has_many :events, through: :user_event_relations

  with_options presence: true do
    validates :uid
    validates :nickname
    validates :name
    validates :image
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    name = auth_hash[:info][:name]
    image = auth_hash[:info][:image]
    # find_or_create_by()は()の中の条件のものが見つければ取得し、なければ新しく作成するというメソッド
    find_or_create_by(uid: uid) do |user|
      user.uid = uid
      user.nickname = nickname
      user.name = name
      user.image = image
    end
  end
end
