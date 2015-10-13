class AddProjectTaskToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :project_id, :integer 
    add_index :entries, :project_id
    add_column :entries, :task_id, :integer 
    add_index :entries, :task_id
  end
end
