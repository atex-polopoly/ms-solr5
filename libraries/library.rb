def generate_parameters
  is_master = node['solr5']['is_master']
  is_slave = node['solr5']['is_slave'] && !node['solr5']['is_master']
  params = ''
  params << " -Dsolr5.master.enabled=true" if is_master
  params << " -Dsolr5.slave.enabled=true" if is_slave
  params << " -Dsolr5.master.host=#{node['solr5']['master']['host']}" if is_slave
  params << " -Dsolr5.master.port=#{node['solr5']['master']['port']}" if is_slave
  params
end
