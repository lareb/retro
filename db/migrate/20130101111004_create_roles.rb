class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string    :name, :null=>false
      t.string    :display_name
      t.boolean   :system
      t.integer   :modified_by
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
