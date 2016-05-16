class AddActivityTypeToLogs < ActiveRecord::Migration
  def change
    add_reference :logs, :activity_type, index: true, foreign_key: true, null: false
  end
end
