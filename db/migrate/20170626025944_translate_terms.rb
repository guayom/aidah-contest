class TranslateTerms < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Setting.create_translation_table!({
          :terms => :text
        }, {
          :migrate_data => true
        })
      end

      dir.down do
        Setting.drop_translation_table! :migrate_data => true
      end
    end
  end
end
