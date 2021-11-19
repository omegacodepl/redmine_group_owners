class CreateGroupOwners < GROUP_OWNERS_PLUGIN_MIGRATION_CLASS
  def change
    create_table :group_owners do |t|
      t.integer :group_id, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
