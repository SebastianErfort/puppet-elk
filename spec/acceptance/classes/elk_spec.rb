# require 'facter'
# require 'beaker-facter'
# require 'beaker/puppet_install_helper'
# require 'spec_helper_acceptance'
# require "rspec-puppet-facts"
# require "vagrant-puppet-fact-generator"

describe 'elk class' do
  context 'default parameters' do
    let(:manifest){
      "class {'elk':}"
    }
    it 'should run without errors' do
      result = apply_manifest(manifest, :catch_failures => true)
      expect(result.exit_code).to eq 2
    end
  end
end