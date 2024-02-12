class AddItemIdToOrderHistories < ActiveRecord::Migration[7.0]
  def change
    add_column :order_histories, :item_id, :integer
  end
end
