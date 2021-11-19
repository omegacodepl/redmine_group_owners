class AddAutoRegisterUrlToGroups < GROUP_OWNERS_PLUGIN_MIGRATION_CLASS
  def change
    add_column Group.table_name.to_sym, :auto_register_url, :string
  end
end
