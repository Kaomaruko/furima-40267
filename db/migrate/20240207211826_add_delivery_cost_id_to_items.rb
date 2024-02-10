class AddDeliveryCostIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :delivery_cost_id, :integer
  end
end
