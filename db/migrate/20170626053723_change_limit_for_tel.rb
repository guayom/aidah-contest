class ChangeLimitForTel < ActiveRecord::Migration[5.0]
  change_table :subscribers do |t|
    t.change :tel, :string
  end
end
