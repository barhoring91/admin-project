class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :app_key, null:false
      t.timestamps null: false
    end
  end
end
