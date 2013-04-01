#
# Cookbook Name:: chef-workstation
# Recipe:: _chef
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

# Downloading an artifact to disk and installing it is the most
# portable pattern.

remote_file "Chef omnibus installer" do
  path "#{Chef::Config[:file_cache_path]}/#{node['chef-workstation']['chef']['package_name']}"
  source node['chef-workstation']['chef']['package_url']
  checksum node['chef-workstation']['chef']['package_checksum']
end

package "chef" do
  source "#{Chef::Config[:file_cache_path]}/#{node['chef-workstation']['chef']['package_name']}"
  action :install
end

