class User < ApplicationRecord

  has_many :user_event_relations
  has_many :events, through: :user_event_relations

  with_options presence: true do
    validates :uid
    validates :nickname
    validates :name
    validates :image
  end
end
