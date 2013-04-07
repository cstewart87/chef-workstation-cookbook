# chef-workstation cookbook
The chef-workstation cookbook is used to set up training targets in
EC2 for the Opscode fundamentals course.

# Requirements
Written and tested against an opscode-ubuntu-12.04 bento box, and the
Canonical ec2 AMI.

# Usage
Include recipe::chef-workstation in your run_list

# Attributes
Recipes are completely driven with attributes. Please see attributes/default.rb.

# Recipes

default.rb
include_recipe "chef-workstation::_users"
include_recipe "chef-workstation::_editors"
include_recipe "chef-workstation::_chef"
include_recipe "chef-workstation::_knife"
include_recipe "chef-workstation::_berkshelf"
include_recipe "chef-workstation::_vagrant"
include_recipe "chef-workstation::_test-kitchen"
include_recipe "chef-workstation::_bento"
include_recipe "chef-workstation::_virtualbox"

# Author

Author:: apachev2 (<Sean OMeara <someara@opscode.com>>)
