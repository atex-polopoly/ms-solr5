#
# Cookbook:: ms-solr5
# Recipe:: install
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'jdk::install'

user 'solr5'

group 'solr5' do
  members 'solr5'
end

#Should validate checksum
remote_file "#{Chef::Config[:file_cache_path]}/solr5.tar.gz" do
  source "ftp://10.10.10.10/mirror/solr5/solr-#{node['solr5']['version']}.tgz"
  ftp_active_mode node['ftp_active_mode']
  not_if { 	File.exists?('/srv/solr5') && Dir.entries('/srv/solr5').select {|f| !File.directory? f}.length > 0}
end

directory '/srv/solr5' do
  user 'solr5'
  group 'solr5'
end

execute "install solr5" do
  cwd Chef::Config[:file_cache_path]
  command "tar -xf #{Chef::Config[:file_cache_path]}/solr5.tar.gz -C /srv/solr5 --strip-components 1"
  not_if { Dir.entries('/srv/solr5').select {|f| !File.directory? f}.length > 0 }
  only_if { File.exists?("#{Chef::Config[:file_cache_path]}/solr5.tar.gz") }
  notifies :run, 'execute[chown solr5]', :immediately
end

execute 'chown solr5' do
  command 'chown solr5:solr5 -R /srv/solr5'
  action :nothing
end

unit = template '/etc/systemd/system/solr5.service' do
  source 'solr5.service.erb'
  variables({
    install_path: node['solr5']['install_path'],
    port: node['solr5']['port'],
    solr_home: node['solr5']['install_path'] + '/solr_home'
    })
end

execute 'systemd-reload' do
  command 'systemctl daemon-reload'
  user 'root'
  only_if { unit.updated_by_last_action? }
end
