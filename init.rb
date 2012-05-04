require 'redmine'
require 'active_support'

require File.dirname(__FILE__) + '/lib/project_patch.rb'
require File.dirname(__FILE__) + '/lib/watchers_helper_patch.rb'

require 'dispatcher'
Dispatcher.to_prepare :refined_watchers_list do
  require_dependency 'project'
  Project.send(:include, RefinedWatchersList::Patches::ProjectPatch)
  require_dependency 'watchers_helper'
  WatchersHelper.send(:include, RefinedWatchersList::Patches::WatchersHelperPatch)
end

Redmine::Plugin.register :refined_watchers_list do
  name 'ChiliProject refined watchers list'
  author 'Ilya Turkin'
  description 'Refine watchers list'
  version '0.0.1'
  author_url 'https://github.com/SyntSupport'
end