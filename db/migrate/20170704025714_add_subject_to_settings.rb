class AddSubjectToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :subject, :string
  end
end
