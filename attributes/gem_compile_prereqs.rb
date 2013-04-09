# _gem_compile_prereqs
if platform == "ubuntu" and platform_version == "12.04" then
  default['chef-workstation']['gem_compile_prereqs']['packages'] = %w{ libxml2-dev libxslt-dev }
elsif platform_family == "rhel" and platform_version.to_f >= 6 and platform_version.to_f < 7 then
  default['chef-workstation']['gem_compile_prereqs']['packages'] = %w{ libxml2-devel libxslt-devel }
end

default['chef-workstation']['vagrant']['gem_binary'] = '/opt/vagrant/embedded/bin/gem'
default['chef-workstation']['vagrant']['bundle_binary'] = '/opt/vagrant/embedded/bin/bundle'
