class AddWelcomeToSetting < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :welcome, :text
    add_column :setting_translations, :welcome, :text
  end
end
