class CreateBugReports < ActiveRecord::Migration[6.1]
  def change
    create_table :bug_reports do |t|
      t.string :robot
      t.string :callback
      t.string :status, null: false
      t.string :description
      t.string :datetime

      t.timestamps
    end
  end
end
