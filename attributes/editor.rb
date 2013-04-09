# _editors
case platform_family
when "debian"
  default['chef-workstation']['editors']['emacs_package'] = "emacs23-nox"
  default['chef-workstation']['editors']['vim_package'] = "vim"
when "rhel"
  default['chef-workstation']['editors']['emacs_package'] = "emacs-nox"
  default['chef-workstation']['editors']['vim_package'] = "vim-enhanced"
end

