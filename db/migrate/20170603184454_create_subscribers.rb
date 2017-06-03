class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :name
      t.integer :tel
      t.string :category
      t.string :country

      t.timestamps
    end
  end
end
