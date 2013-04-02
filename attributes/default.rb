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
default['chef-workstation']['user']['password'] = '$6$T6sYIdBH$DaDmnmBwQnixXkaW05B4Jd1ILxEDJ3m4XKhoeiFSxQhBq7c4a/FYqEml1wrm9jlzJ7Cv6rdrLXBgLRlyGm7KF0' #opscodechef
default['chef-workstation']['user']['home'] = '/home/opscode'
default['chef-workstation']['user']['shell'] = '/bin/bash'
default['chef-workstation']['user']['gem_home'] = "#{node['chef-workstation']['user']['home'] }/.gem"

# _editors
case platform_family
when "debian"
  default['chef-workstation']['editors']['emacs_package'] = "emacs23-nox"
  default['chef-workstation']['editors']['vim_package'] = "vim"
when "rhel"
  default['chef-workstation']['editors']['emacs_package'] = "emacs-nox"
  default['chef-workstation']['editors']['vim_package'] = "vim-enhanced"
end
  
# _chef
if platform == "ubuntu" and platform_version == "12.04" then
  default['chef-workstation']['chef']['package_name'] = "chef_11.4.0-1.ubuntu.10.04_amd64.deb"
  default['chef-workstation']['chef']['package_url'] = "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/x86_64/chef_11.4.0-1.ubuntu.11.04_amd64.deb"
  default['chef-workstation']['chef']['package_checksum'] = "5099b69f4939d7c42b85aec99d56e1b988d697a4be74b0db627c2548935e9be7"
elsif platform_family == "rhel" and platform_version.to_f >= 6 and platform_version.to_f < 7 then
  default['chef-workstation']['chef']['package_name'] = "chef-11.4.0-1.el6.x86_64.rpm"
  default['chef-workstation']['chef']['package_url'] = "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-11.4.0-1.el6.x86_64.rpm"
  default['chef-workstation']['chef']['package_checksum'] = "a38da78ea6e2890a00086d11f8ed3abd0817db112d86e304dd740685316b4d81"
end
  
default['chef-workstation']['chef']['gem_binary'] = '/opt/chef/embedded/bin/gem'
default['chef-workstation']['chef']['bundle_binary'] = '/opt/chef/embedded/bin/bundle'

# _gem_compile_prereqs
if platform == "ubuntu" and platform_version == "12.04" then
  default['chef-workstation']['gem_compile_prereqs']['packages'] = %w{ libxml2-dev libxslt-dev }
elsif platform_family == "rhel" and platform_version.to_f >= 6 and platform_version.to_f < 7 then
  default['chef-workstation']['gem_compile_prereqs']['packages'] = %w{ libxml2-devel libxslt-devel }
end

default['chef-workstation']['vagrant']['gem_binary'] = '/opt/vagrant/embedded/bin/gem'
default['chef-workstation']['vagrant']['bundle_binary'] = '/opt/vagrant/embedded/bin/bundle'

#_knife
default['chef-workstation']['knife']['gem_binary'] = '/opt/chef/embedded/bin/gem'

default['chef-workstation']['knife']['iaas_plugins'] = {
  "knife-ec2" => "0.6.2",
  "knife-joyent" => "0.1.1",
  "knife-openstack" => "0.7.0",
  "knife-rackspace" => "0.6.2",
  "knife-vsphere" => "0.4.0"
}

default['chef-workstation']['knife']['utils'] = {
  "knife-easybake" => "0.0.10",
  "knife-windows" => "0.5.12"
}

# _berkshelf
default['chef-workstation']['berkshelf']['gems'] = {
  "berkshelf" => "1.3.1"
}

# _vagrant
if platform == "ubuntu" and platform_version == "12.04" then
  default['chef-workstation']['vagrant']['package_name'] = "vagrant_x86_64.deb"
  default['chef-workstation']['vagrant']['package_url'] = "http://files.vagrantup.com/packages/87613ec9392d4660ffcb1d5755307136c06af08c/vagrant_x86_64.deb"
  default['chef-workstation']['vagrant']['package_checksum'] = "8cb1ef68e13e257d524366cdf1a6d074ef37a6a391cfd7c36cad6e4712ef0419"
  default['chef-workstation']['vagrant']['gem_binary'] = '/opt/vagrant/embedded/bin/gem'
  default['chef-workstation']['vagrant']['bundle_binary'] = '/opt/vagrant/embedded/bin/bundle'
elsif platform_family == "rhel" and platform_version.to_f >= 6 and platform_version.to_f < 7 then
  default['chef-workstation']['vagrant']['package_url'] = "http://files.vagrantup.com/packages/87613ec9392d4660ffcb1d5755307136c06af08c/vagrant_x86_64.rpm"
  default['chef-workstation']['vagrant']['package_name'] = "vagrant_x86_64.rpm"
  default['chef-workstation']['vagrant']['package_checksum'] = "cfef5ea7fa3ab1c7403898b0cedc4164c0549a3ee56c32b8e36f7d339769e007"
  default['chef-workstation']['vagrant']['gem_binary'] = '/opt/vagrant/embedded/bin/gem'
  default['chef-workstation']['vagrant']['bundle_binary'] = '/opt/vagrant/embedded/bin/bundle'
end

#_test-kitchen
default['chef-workstation']['test-kitchen']['gems'] = {
  "test-kitchen" => "1.0.0.alpha.2",
  "kitchen-vagrant" => "0.7.4"
}

# _bento
default['chef-workstation']['bento']['repo'] = 'https://github.com/opscode/bento.git'
default['chef-workstation']['bento']['branch'] = 'master'
default['chef-workstation']['bento']['gem_binary'] = node['chef-workstation']['vagrant']['gem_binary']
default['chef-workstation']['bento']['bundle_binary'] = node['chef-workstation']['vagrant']['bundle_binary']

