describe http('https://'+input('URL'), ssl_verify: true) do
     its('status') { should cmp 403 }
  end

describe host(input('URL'), port: 443, protocol: 'tcp') do
     it { should be_reachable }
     it { should be_resolvable }
  end

describe command('dig '+input('URL')) do
     its('stdout') { should match 'IN A 20.61' }
  end