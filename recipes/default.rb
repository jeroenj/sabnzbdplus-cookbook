apt_repository 'sabnzbdplus' do
  uri node[:sabnzbdplus][:apt][:uri]
  distribution node[:sabnzbdplus][:apt][:distribution]
end

package 'sabnzbdplus'

service 'sabnzbdplus'

user 'sabnzbdplus' do
  system true
  shell '/bin/false'
end

directory node[:sabnzbdplus][:config_directory] do
  user node[:sabnzbdplus][:user]
  group node[:sabnzbdplus][:user]
end

scripts_path = ::File.join(node[:sabnzbdplus][:config_directory], 'scripts')

directory scripts_path do
  user node[:sabnzbdplus][:user]
  group node[:sabnzbdplus][:user]
end

template ::File.join(node[:sabnzbdplus][:config_directory], 'sabnzbd.ini') do
  source 'sabnzbd.ini.erb'
  variables({
    username: node[:sabnzbdplus][:preferences][:username],
    password: node[:sabnzbdplus][:preferences][:password],
    api_key: node[:sabnzbdplus][:preferences][:api_key],
    https: node[:sabnzbdplus][:preferences][:https],
    https_port: node[:sabnzbdplus][:preferences][:https_port],
    https_key: node[:sabnzbdplus][:preferences][:https_key],
    https_cert: node[:sabnzbdplus][:preferences][:https_cert],
    schedule: node[:sabnzbdplus][:preferences][:schedule],
    complete_dir: node[:sabnzbdplus][:preferences][:complete_dir],
    download_dir: node[:sabnzbdplus][:preferences][:download_dir],
    dirscan_dir: node[:sabnzbdplus][:preferences][:dirscan_dir],
    script_dir: scripts_path,
    bandwidth_limit: node[:sabnzbdplus][:preferences][:bandwidth_limit],
    permissions: node[:sabnzbdplus][:preferences][:permissions],
    servers: node[:sabnzbdplus][:preferences][:servers],
    tv: node[:sabnzbdplus][:preferences][:tv],
    movies: node[:sabnzbdplus][:preferences][:movies]
  })
  owner node[:sabnzbdplus][:user]
  group node[:sabnzbdplus][:user]
  notifies :restart, 'service[sabnzbdplus]'
end

template '/etc/default/sabnzbdplus' do
  source 'default.erb'
  variables(
    user: node[:sabnzbdplus][:user],
    config_directory: node[:sabnzbdplus][:config_directory]
  )
  notifies :restart, 'service[sabnzbdplus]'
end

if node[:sickbeard] && node[:sabnzbdplus][:preferences][:tv]
  %w[autoProcessTV.py sabToSickBeard.py].each do |file|
    link ::File.expand_path(file, scripts_path) do
      to ::File.join(node[:sickbeard][:install_dir], 'autoProcessTV', file)
      owner node[:sabnzbdplus][:user]
      group node[:sabnzbdplus][:user]
    end
  end

  template ::File.expand_path('autoProcessTV.cfg', scripts_path) do
    source 'autoProcessTV.cfg.erb'
    variables({
      host: node[:sabnzbdplus][:preferences][:tv][:sickbeard][:host],
      port: node[:sabnzbdplus][:preferences][:tv][:sickbeard][:port],
      username: node[:sabnzbdplus][:preferences][:tv][:sickbeard][:username],
      password: node[:sabnzbdplus][:preferences][:tv][:sickbeard][:password],
      ssl: node[:sabnzbdplus][:preferences][:tv][:sickbeard][:ssl]
    })
    owner node[:sabnzbdplus][:user]
    group node[:sabnzbdplus][:user]
  end
end

if node[:sabnzbdplus][:preferences][:movies]
  template ::File.expand_path('update_plex_movies.sh', scripts_path) do
    source 'update_plex_movies.sh.erb'
    variables({
      plex_movies_id: node[:sabnzbdplus][:preferences][:movies][:plex_movies_id]
    })
    mode 0755
    owner node[:sabnzbdplus][:user]
    group node[:sabnzbdplus][:user]
  end
end
