server '54.64.40.112', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/aguru/.ssh/id_rsa'