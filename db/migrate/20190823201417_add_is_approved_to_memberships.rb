class AddIsApprovedToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :is_approved, :boolean, default: false
  end
end
