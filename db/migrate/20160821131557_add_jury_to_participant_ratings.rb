class AddJuryToParticipantRatings < ActiveRecord::Migration[5.0]
  def change
    add_reference :participant_ratings, :jury, foreign_key: true
  end
end
