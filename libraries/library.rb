def generate_parameters
  params = ''
  params << " -Dsolr5.master.enabled=true" if node['solr5']['is_master']
  params << " -Dsolr5.slave.enabled=true" if node['solr5']['is_slave']
  params << " -Dsolr5.master.host=#{node['solr5']['master']['host']}" if node['solr5']['is_slave']
  params << " -Dsolr5.master.port=#{node['solr5']['master']['port']}" if node['solr5']['is_slave']
  params
end
