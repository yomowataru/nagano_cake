class RemoveMakingStatusFromOrderDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_details, :making_status, :integer
  end
end
