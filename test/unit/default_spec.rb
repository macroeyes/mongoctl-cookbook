require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'mongoctl::default' do

  let(:chef_run) do
    ChefSpec::Runner.new(
      :platform => 'ubuntu',
      :version => '12.04'
    )
  end

  it 'should include install recipe' do
    chef_run.converge(described_recipe)
    chef_run.should include_recipe('mongoctl::install')
  end

end
