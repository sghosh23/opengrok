class ChangeRailsApiToken < ActiveRecord::Migration
  def change
  	change_column :rest_apis, :session_id, :string
  end
end
