class AddTranslationToSubject < ActiveRecord::Migration[5.0]
  def change
    add_column :setting_translations, :subject, :text
  end
end
