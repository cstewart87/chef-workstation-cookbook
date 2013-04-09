# _user 
default['chef-workstation']['user']['name'] = 'opscode'
default['chef-workstation']['user']['group'] = 'opscode'
default['chef-workstation']['user']['password'] = '$6$T6sYIdBH$DaDmnmBwQnixXkaW05B4Jd1ILxEDJ3m4XKhoeiFSxQhBq7c4a/FYqEml1wrm9jlzJ7Cv6rdrLXBgLRlyGm7KF0' #opscodechef
default['chef-workstation']['user']['home'] = '/home/opscode'
default['chef-workstation']['user']['shell'] = '/bin/bash'
default['chef-workstation']['user']['gem_home'] = "#{node['chef-workstation']['user']['home'] }/.gem"
