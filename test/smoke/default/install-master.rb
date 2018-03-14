# # encoding: utf-8

# Inspec test for recipe ms-solr5::install

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/systemd/system/solr5.service') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('content') { should include(' -Dsolr5.master.enabled=true')}
end
