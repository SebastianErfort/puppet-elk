# require 'facter'
require 'beaker'
require 'beaker-puppet'
require 'beaker-rspec'
require 'beaker_spec_helper'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'
require 'beaker-facter'
require 'rspec-puppet'
require 'rspec-puppet-facts'
require 'puppetlabs_spec_helper'
# require 'vagrant-puppet-fact-generator'
  # gem "beaker-vagrant"
  # gem "beaker-puppet_install_helper"
  # gem "beaker-module_install_helper"
  # gem "puppetlabs_spec_helper"
require 'spec_helper'

logger.error("LOADED MYYYYYYYYYY Spec Acceptance Helper")

# Install Puppet on all hosts
install_puppet_agent_on(hosts, options)

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    # Install module to all hosts
    hosts.each do |host|
      install_dev_puppet_module_on(host, :source => module_root, :module_name => 'elk',
          :target_module_path => '/etc/puppetlabs/code/modules')
    end
  end
end