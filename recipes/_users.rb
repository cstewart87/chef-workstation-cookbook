#
# Cookbook Name:: chef-workstation
# Recipe:: _users
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

# add user opscode, password 'opscodechef'
user node['chef-workstation']['user']['name'] do
  password node['chef-workstation']['user']['password']
  home node['chef-workstation']['user']['home']
  shell node['chef-workstation']['user']['shell']
  supports :manage_home => true
  action [:create, :manage]
end

group "sudo" do
  members node['chef-workstation']['user']['name']
  append true
end

cookbook_file "#{node['chef-workstation']['user']['home']}/.bash_profile" do
  user node['chef-workstation']['user']['name']
  group node['chef-workstation']['user']['group']
end

