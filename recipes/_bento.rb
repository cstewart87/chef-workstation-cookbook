#
# Cookbook Name:: chef-workstation
# Recipe:: _bento
#
# Copyright 2012-2013, Opscode
# Author:: Sean OMeara <someara@opscode.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# we're going to need to install bento into vagran't embedded ruby environment
# FIXME create vagrant-bento
include_recipe "chef-workstation::_vagrant"
include_recipe "chef-workstation::_gem_compile_prereqs"

# src directory for cookbookery
directory "#{node['chef-workstation']['user']['home']}/src" do
  owner node['chef-workstation']['user']['name']
  recursive true
end

# check out bento from git 
git 'bento source repository' do
  destination "#{node['chef-workstation']['user']['home']}/src/bento"
  repository node['chef-workstation']['bento']['repo']
  reference node['chef-workstation']['bento']['branch']
  action :checkout
  user node['chef-workstation']['user']['name']
  group node['chef-workstation']['user']['group']
  notifies :run, 'execute[install bento bundle]'
end

# bundle install bento
execute "install bento bundle" do
  command "#{node['chef-workstation']['bento']['bundle_binary']} install --path=#{node['chef-workstation']['user']['home']}"
  environment "HOME" => node['chef-workstation']['user']['home']
  user node['chef-workstation']['user']['name']
  cwd "#{node['chef-workstation']['user']['home']}/src/bento"
  action :nothing
end

