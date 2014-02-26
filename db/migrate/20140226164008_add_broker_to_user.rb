class AddBrokerToUser < ActiveRecord::Migration
  def change
    add_column :users, :broker, :string
  end
end
