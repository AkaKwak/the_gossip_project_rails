class RemoveVilleFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :ville, :string
  end
end
