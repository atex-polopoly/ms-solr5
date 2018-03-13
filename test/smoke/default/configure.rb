# # encoding: utf-8

# Inspec test for recipe ms-solr5::configure

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/srv/solr5/solr_home') do
  it { should exist }
  it { should be_owned_by 'solr5' }
  it { should be_grouped_into 'solr5' }
  its('link_path') { should eq '/mnt/data/solr5/solr_home' }
  its('mode') { should cmp '00755' }
  its('type') { should cmp 'link' }
end
