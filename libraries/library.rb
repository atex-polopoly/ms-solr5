def generate_parameters
  is_master = node['solr5']['is_master']
  is_slave = node['solr5']['is_slave'] && !node['solr5']['is_master']

  if is_slave
    solr5_master =
      search(:node, "recipes:*ms-solr5* AND chef_environment:#{node.chef_environment} AND solr5_is_master:true",
                  :filter_result => { 'ipaddress' => [ 'ipaddress'],
                                      'port' => [ 'solr5', 'port']})[0]
    if !solr5_master.nil?
      solr5_master_host = solr5_master['ipaddress']
      solr5_master_port = solr5_master['port']
    end
  end

  params = ''
  params << " -Dsolr5.master.enabled=true" if is_master
  params << " -Dsolr5.slave.enabled=true" if is_slave
  params << " -Dsolr5.master.host=#{solr5_master_host}" if is_slave
  params << " -Dsolr5.master.port=#{solr5_master_port}" if is_slave
  params
end
