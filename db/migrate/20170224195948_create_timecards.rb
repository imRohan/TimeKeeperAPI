class CreateTimecards < ActiveRecord::Migration[5.0]
  def change
    create_table :timecards do |t|
      t.timestamps
      t.string  :username
      t.date    :occurrence
    end
  end
end
