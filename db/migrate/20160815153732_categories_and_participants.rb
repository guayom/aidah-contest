class CategoriesAndParticipants < ActiveRecord::Migration[5.0]
  create_table :categories_participants, id: false do |t|
      t.belongs_to :participant, index: true
      t.belongs_to :category, index: true
    end
end
