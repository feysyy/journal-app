class AddDateToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :date, :datetime
  end
end