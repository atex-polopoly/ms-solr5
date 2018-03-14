# # encoding: utf-8

# Inspec test for recipe ms-solr5::install

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe user('solr5') do
  it { should exist }
  its('groups') { should include('solr5') }
end

describe group('solr5') do
  it { should exist }
end

describe file('/srv/solr5') do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by 'solr5' }
  it { should be_grouped_into 'solr5' }
end

describe service('solr5') do
  it { should be_installed }
  it { should be_enabled }
end

describe file('/etc/systemd/system/solr5.service') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  its('content') { should include('/srv/solr5/bin/solr start -p 8983 -s /srv/solr5/solr_home')}
end
