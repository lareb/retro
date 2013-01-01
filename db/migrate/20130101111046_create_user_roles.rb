class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.integer   :user_id, :null=>false
      t.integer   :role_id, :null=>false
      t.integer   :modified_by
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
