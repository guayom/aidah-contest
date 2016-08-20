class CreateParticipantRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :participant_ratings do |t|
      t.references :participant, foreign_key: true
      t.references :category, foreign_key: true
      t.references :parameter, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
