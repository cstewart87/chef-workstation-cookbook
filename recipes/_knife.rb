#
# Cookbook Name:: chef-workstation
# Recipe:: _knife
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

include_recipe "chef-workstation::_gem_compile_prereqs"

node['chef-workstation']['knife']['iaas_plugins'].each do |gem,ver|
  gem_package gem do
    gem_binary node['chef-workstation']['knife']['gem_binary']
    version ver
    options("--install-dir=#{node['chef-workstation']['user']['gem_home']}" )
    notifies :run, 'execute[fix gemhome permissions]', :immediately
  end
end

node['chef-workstation']['knife']['utils'].each do |gem,ver|
  gem_package gem do
    gem_binary node['chef-workstation']['knife']['gem_binary']
    version ver
    options("--install-dir=#{node['chef-workstation']['user']['gem_home']}" )
    notifies :run, 'execute[fix gemhome permissions]', :immediately
  end
end

# hax
execute "fix gemhome permissions" do
  cmd = "chown -R"
  cmd << " #{node['chef-workstation']['user']['name']}:"
  cmd << "#{node['chef-workstation']['user']['name']}"
  cmd << " #{node['chef-workstation']['user']['gem_home']}"  
  command cmd
  action :nothing
end
