class User < ApplicationRecord

  has_many :user_event_relations
  has_many :events, through: :user_event_relations
end
