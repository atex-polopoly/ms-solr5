#
# Cookbook:: ms-solr5
# Recipe:: configure
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory '/mnt/data/solr5/solr_home' do
  owner 'solr5'
  group 'solr5'
  mode '0755'
  recursive true
  action :create
end

link 'symlink solr_home' do
  target_file node['solr5']['home']
  to '/mnt/data/solr5/solr_home'
  owner 'solr5'
  group 'solr5'
end

cookbook_file "#{node['solr5']['home']/solr.xml}" do
  source 'solr.xml'
  owner 'solr5'
  group 'solr5'
  mode '0644'
end
