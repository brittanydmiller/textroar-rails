class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :survey_id
      t.string :response_text
      t.string :response_key
    end
  end
end
