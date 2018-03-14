def generate_parameters
  params = ''
  params << " -Dsolr5.master.enabled=true" if node['solr5']['master']
  params << " -Dsolr5.slave.enabled=true" if node['solr5']['slave']
  params << " -Dsolr5.master.host=#{node['solr5']['host']}" if node['solr5']['slave']
  params << " -Dsolr5.master.port=#{node['solr5']['port']}" if node['solr5']['slave']
  params
end
