class ChangeInvoiced < ActiveRecord::Migration
  def change
    change_column :entries, :invoiced, :boolean, :default => false;
  end
end
