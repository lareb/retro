class AddStatusInAdmission < ActiveRecord::Migration
  def up
    add_column(:admissions, :status, :string)
  end

  def down
    remove_column(:admissions, :status)
  end
end
