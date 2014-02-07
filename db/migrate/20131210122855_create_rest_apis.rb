class CreateRestApis < ActiveRecord::Migration
  def change
    create_table :rest_apis do |t|
      t.integer :session_id
      t.string :link

      t.timestamps
    end
  end
end
