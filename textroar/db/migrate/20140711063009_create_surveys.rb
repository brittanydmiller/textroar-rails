class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :descr
      t.string :vote_start
      t.string :vote_end
      t.string :poll_key
      t.string :phone
      t.integer :user_id
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
