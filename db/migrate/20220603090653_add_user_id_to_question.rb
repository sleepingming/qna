class AddUserIdToQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :user_id, :integer
  end
end
