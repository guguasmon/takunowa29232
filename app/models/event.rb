class Event < ApplicationRecord

  has_many :user_event_relations
  has_many :users, through: :user_event_relations
end
