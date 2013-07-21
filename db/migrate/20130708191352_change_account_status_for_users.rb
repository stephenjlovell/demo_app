class ChangeAccountStatusForUsers < ActiveRecord::Migration
  def change
    change_column :users, :account_status, :string, default: "inactive"
  end
end
