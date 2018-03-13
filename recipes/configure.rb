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

link '/srv/solr5/solr_home' do
  to '/mnt/data/solr5/solr_home'
  owner 'solr5'
  group 'solr5'
end
