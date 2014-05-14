require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'mongoctl::install' do

  let(:chef_run) do
    ChefSpec::Runner.new(
      :platform => 'ubuntu',
      :version => '12.04'
    )
  end

  it 'should include python::pip recipe' do
    chef_run.converge(described_recipe)
    chef_run.should include_recipe('python::pip')
  end

end
