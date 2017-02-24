class CreateTimeEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :time_entries do |t|
      t.timestamps
      t.integer :timecard_id
      t.datetime  :time
    end
  end
end
