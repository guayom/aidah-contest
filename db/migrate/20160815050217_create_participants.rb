class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.string :lastname
      t.string :lastname2
      t.string :tel
      t.text :bio

      t.timestamps
    end
  end
end
