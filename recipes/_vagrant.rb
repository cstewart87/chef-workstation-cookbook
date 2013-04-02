#
# Cookbook Name:: chef-workstation
# Recipe:: _vagrant
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

remote_file "Vagrant fullstack installer" do
  path "#{Chef::Config[:file_cache_path]}/#{node['chef-workstation']['vagrant']['package_name']}"
  source node['chef-workstation']['vagrant']['package_url']
  checksum node['chef-workstation']['vagrant']['package_checksum']
end

# FIXME search for / file a ticket
# when using "package" on debian, it will install from apt rather than
# the specified source
case node['platform_family']
when "debian"
  dpkg_package "vagrant" do
    source "#{Chef::Config[:file_cache_path]}/#{node['chef-workstation']['vagrant']['package_name']}"
    action :install
  end
else
  package "vagrant" do
    source "#{Chef::Config[:file_cache_path]}/#{node['chef-workstation']['vagrant']['package_name']}"
    action :install
  end
end

execute "vagrant plugin install berkshelf-vagrant" do
  user node['chef-workstation']['user']['name']
  environment "HOME" => node['chef-workstation']['user']['home']
  not_if "vagrant plugin list | grep ^berkshelf-vagrant-"
end

execute "vagrant plugin install vagrant-aws" do
  environment "HOME" => node['chef-workstation']['user']['home']
  user node['chef-workstation']['user']['name']
  not_if "vagrant plugin list | grep ^vagrant-aws-"
end

gem_package "bundler" do
  gem_binary node['chef-workstation']['vagrant']['gem_binary']
end
