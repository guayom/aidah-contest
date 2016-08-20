class ParticipantRating < ApplicationRecord
  belongs_to :participant
  belongs_to :category
  belongs_to :parameter
end
