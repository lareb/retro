class CreateDoccuments < ActiveRecord::Migration
  def change
    create_table :doccuments do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
