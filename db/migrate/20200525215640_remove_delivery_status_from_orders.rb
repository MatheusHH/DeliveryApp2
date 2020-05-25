class RemoveDeliveryStatusFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :delivery_status, :integer
  end
end
