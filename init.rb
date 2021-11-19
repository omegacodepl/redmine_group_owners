require 'group_owners_patches'
Redmine::Plugin.register :redmine_group_owners do
  name 'Redmine Group Owners plugin'
  author 'Tomasz Gietek for Omega Code Sp. z o.o.'
  description 'This is a plugin for Redmine to allow admins to add owners for a group to manage it.'
  version '2.0.1'
  author_url 'https://github.com/omegacodepl'

  menu(:top_menu, :groups, { :controller => 'groups', :action => 'index' }, :caption => :label_group_plural, :after => :projects, :if => Proc.new {User.current.logged? && User.current.owned_groups.any?})

  if Rails::VERSION::MAJOR >= 5
    version = "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}".to_f
    GROUP_OWNERS_PLUGIN_MIGRATION_CLASS = ActiveRecord::Migration[version]
  else
    GROUP_OWNERS_PLUGIN_MIGRATION_CLASS = ActiveRecord::Migration
  end
end
