class FixResponseColumnNames < ActiveRecord::Migration
  def up
    rename_column :responses, :response_text, :text
    rename_column :responses, :response_key, :key
  end

  def down
    rename_column :responses, :text, :response_text
    rename_column :responses, :key, :response_key
  end
end
