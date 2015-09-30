class AddInvoicedToEntries < ActiveRecord::Migration
  def change
      add_column :entries, :invoiced, :boolean
  end
end
