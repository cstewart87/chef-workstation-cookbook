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
