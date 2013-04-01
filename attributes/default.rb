#
# Cookbook Name:: chef-workstation
# Attributes file:: default
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

# _user
default['chef-workstation']['user']['name'] = 'opscode'
default['chef-workstation']['user']['group'] = 'opscode'
default['chef-workstation']['user']['password'] = '$6$T6sYIdBH$DaDmnmBwQnixXkaW05B4Jd1ILxEDJ3m4XKhoeiFSxQhBq7c4a/FYqEml1wrm9jlzJ7Cv6rdrLXBgLRlyGm7KF0'
default['chef-workstation']['user']['home'] = '/home/opscode'
default['chef-workstation']['user']['shell'] = '/bin/bash'

# _chef
default['chef-workstation']['chef']['package_url'] = "https://opscode-omnitruck-release.s3.amazonaws.com/ubuntu/11.04/x86_64/chef_11.4.0-1.ubuntu.11.04_amd64.deb"
default['chef-workstation']['chef']['gem_binary'] = '/opt/chef/embedded/bin/gem'
default['chef-workstation']['chef']['bundle_binary'] = '/opt/chef/embedded/bin/bundle'

# _vagrant
default['chef-workstation']['vagrant']['package_name'] = "vagrant_x86_64.deb"
default['chef-workstation']['vagrant']['package_url'] = "http://files.vagrantup.com/packages/87613ec9392d4660ffcb1d5755307136c06af08c/vagrant_x86_64.deb"
default['chef-workstation']['vagrant']['package_checksum'] = "8cb1ef68e13e257d524366cdf1a6d074ef37a6a391cfd7c36cad6e4712ef0419"
default['chef-workstation']['vagrant']['gem_binary'] = '/opt/vagrant/embedded/bin/gem'
default['chef-workstation']['vagrant']['bundle_binary'] = '/opt/vagrant/embedded/bin/bundle'

# _bento
default['chef-workstation']['bento']['repo'] = 'https://github.com/opscode/bento.git'
default['chef-workstation']['bento']['branch'] = 'master'
default['chef-workstation']['bento']['gem_binary'] = node['chef-workstation']['vagrant']['gem_binary']
default['chef-workstation']['bento']['bundle_binary'] = node['chef-workstation']['vagrant']['bundle_binary']

