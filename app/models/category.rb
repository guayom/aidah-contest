class Category < ApplicationRecord
  has_and_belongs_to_many :participants
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :participant_ratings
end
