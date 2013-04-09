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

# # src directory for easybake
# directory "#{node['chef-workstation']['user']['home']}/src" do
#   owner node['chef-workstation']['user']['name']
#   recursive true
# end

# # check out bento from git 
# git 'someara easybake fork' do
#   destination "#{node['chef-workstation']['user']['home']}/src/knife-easybake"
#   repository node['chef-workstation']['easybake']['repo']
#   reference node['chef-workstation']['easybake']['branch']
#   action :checkout
#   user node['chef-workstation']['user']['name']
#   group node['chef-workstation']['user']['group']
#   notifies :run, 'execute[build knife-easybake]'
# end

# # build knife-easybake
# execute "build knife-easybake" do
#   command "#{node['chef-workstation']['easybake']['gem_binary']} build knife-easybake.gemspec"
#   environment "HOME" => node['chef-workstation']['user']['home']
#   user node['chef-workstation']['user']['name']
#   cwd "#{node['chef-workstation']['user']['home']}/src/knife-easybake"
#   action :nothing
#   notifies :run, 'execute[install knife-easybake]'
# end

# # install knife-easybake
# execute "install knife-easybake" do
#   command "#{node['chef-workstation']['easybake']['gem_binary']} install knife-easybake-0.0.10.gem --install-dir /home/opscode/.gem"
#   environment "HOME" => node['chef-workstation']['user']['home']
#   user node['chef-workstation']['user']['name']
#   cwd "#{node['chef-workstation']['user']['home']}/src/knife-easybake"
#   action :nothing
# end

# hax
execute "fix gemhome permissions" do
  cmd = "chown -R"
  cmd << " #{node['chef-workstation']['user']['name']}:"
  cmd << "#{node['chef-workstation']['user']['name']}"
  cmd << " #{node['chef-workstation']['user']['gem_home']}"  
  command cmd
  action :nothing
end
