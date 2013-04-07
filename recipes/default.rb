#
# Cookbook Name:: chef-workstation
# Recipe:: default
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

include_recipe "build-essential"
include_recipe "chef-workstation::_users"
include_recipe "chef-workstation::_editors"
include_recipe "chef-workstation::_chef"
include_recipe "chef-workstation::_knife"
include_recipe "chef-workstation::_berkshelf"
include_recipe "chef-workstation::_vagrant"
include_recipe "chef-workstation::_test-kitchen"
include_recipe "chef-workstation::_bento"
include_recipe "chef-workstation::_virtualbox"
include_recipe "chef-workstation::_sshd"
