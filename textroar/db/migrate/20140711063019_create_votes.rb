class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :phone
      t.string :choice
      t.string :latitude
      t.string :longitude
      t.string :ticket
      t.integer :survey_id
      t.timestamps
    end
  end
end
