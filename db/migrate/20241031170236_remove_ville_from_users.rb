class RemoveVilleFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :town, :string
  end
end