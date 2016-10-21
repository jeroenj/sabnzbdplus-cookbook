default[:sabnzbdplus][:user] = 'sabnzbdplus'
default[:sabnzbdplus][:config_directory] = '/etc/sabnzbdplus'

default[:sabnzbdplus][:apt][:uri] = 'ppa:jcfp/nobetas'
default[:sabnzbdplus][:apt][:distribution] = node[:lsb][:codename]

default[:sabnzbdplus][:preferences][:port] = 8080
default[:sabnzbdplus][:preferences][:https] = 0
default[:sabnzbdplus][:preferences][:https_port] = 9090
default[:sabnzbdplus][:preferences][:https_key] = '""'
default[:sabnzbdplus][:preferences][:https_cert] = '""'
default[:sabnzbdplus][:preferences][:schedule] = []

default[:sabnzbdplus][:preferences][:complete_dir] = '/usr/data/downloads/complete'
default[:sabnzbdplus][:preferences][:download_dir] = '/usr/data/downloads/incomplete'
default[:sabnzbdplus][:preferences][:dirscan_dir] = '/usr/data/downloads/nzb'

default[:sabnzbdplus][:preferences][:bandwidth_limit] = 1000
default[:sabnzbdplus][:preferences][:bandwidth_max] = '1M'
default[:sabnzbdplus][:preferences][:bandwidth_perc] = 0
default[:sabnzbdplus][:preferences][:permissions] = 775

default[:sabnzbdplus][:preferences][:username] = ''
default[:sabnzbdplus][:preferences][:password] = ''
default[:sabnzbdplus][:preferences][:api_key] = ''

default[:sabnzbdplus][:preferences][:servers] = [] # :connections, :hostname, :password, :port, :retention, :ssl, :username

# default[:sabnzbdplus][:preferences][:tv] = {
#   sickbeard: {
#     host: 'localhost',
#     port: 8080,
#     username: 'username',
#     password: 'password',
#     ssl: 1
#   }
# }

# default[:sabnzbdplus][:preferences][:movies] = {
#   sickbeard: {
#     directory: '/foo/bar',
#     plex_movies_id: 1
#   }
# }
