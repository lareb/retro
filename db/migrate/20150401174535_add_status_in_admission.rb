class AddStatusInAdmission < ActiveRecord::Migration
  def up
    add_column(:admissions, :status, :string, :default => "New")
  end

  def down
    remove_column(:admissions, :status)
  end
end
