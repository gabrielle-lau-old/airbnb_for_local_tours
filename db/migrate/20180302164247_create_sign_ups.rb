class CreateSignUps < ActiveRecord::Migration
  def change
    create_table :sign_ups do |t|
      t.integer :tourist_id
      t.integer :event_id

      t.timestamps

    end
  end
end
