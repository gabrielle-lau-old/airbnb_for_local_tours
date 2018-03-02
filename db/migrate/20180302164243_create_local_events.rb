class CreateLocalEvents < ActiveRecord::Migration
  def change
    create_table :local_events do |t|
      t.string :event_name
      t.date :date
      t.string :city
      t.integer :host_id

      t.timestamps

    end
  end
end
