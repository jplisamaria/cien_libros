class CreateParentProfiles < ActiveRecord::Migration
  def change
    create_table :parent_profiles do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
