#
# Cookbook:: ms-solr5
# Recipe:: configure
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory node['solr5']['home'] do
  owner 'solr5'
  group 'solr5'
  mode '0755'
  recursive true
  action :create
end
