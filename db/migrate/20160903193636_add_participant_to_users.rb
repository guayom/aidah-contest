class AddParticipantToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :participant, foreign_key: true
  end
end
