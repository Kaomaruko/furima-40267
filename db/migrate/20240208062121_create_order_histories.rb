class CreateOrderHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :order_histories do |t|

      t.timestamps
    end
  end
end
