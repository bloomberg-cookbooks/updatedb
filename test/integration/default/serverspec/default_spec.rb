require 'serverspec'
set :backend, :exec


describe file('/etc/updatedb.conf') do
  it { should be_file }
  it { should be_owned_by 'root' }
  its(:content) { should match 'PRUNE_BIND_MOUNTS="yes"' }
  its(:content) { should contain 'PRUNEFS'}
end
