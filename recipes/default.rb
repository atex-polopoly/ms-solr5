#
# Cookbook:: ms-solr5
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'ms-solr5::install'
include_recipe 'ms-solr5::configure'

service 'solr5' do
  ignore_failure true
  action [:enable, :start]
end
