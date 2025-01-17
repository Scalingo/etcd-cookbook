include EtcdCookbook::EtcdCommonProperties

resource_name :etcd_installation_binary
provides :etcd_installation_binary
provides :etcd_installation

unified_mode true

#####################
# resource properties
#####################

property :checksum, String, default: lazy { default_checksum }, desired_state: false
property :source, String, default: lazy { default_source }, desired_state: false
property :version, String, default: '3.2.15', desired_state: false

default_action :create

#########
# actions
#########

action :create do
  package 'tar'

  remote_file 'etcd tarball' do
    path "#{file_cache_path}/etcd-v#{new_resource.version}-linux-amd64.tar.gz"
    source new_resource.source
    checksum new_resource.checksum
    action :create
  end

  directory new_resource.etcd_bin_prefix do
    action :create
  end

  file 'etcd_checksum' do
    path "#{new_resource.etcd_bin_prefix}/.etcd_checksum"
    content new_resource.checksum
  end

  execute 'extract etcd' do
    command extract_etcd_cmd
    action :nothing
    subscribes :run, 'file[etcd_checksum]'
  end

  execute 'extract etcdctl' do
    command extract_etcdctl_cmd
    action :nothing
    subscribes :run, 'file[etcd_checksum]'
  end
end

action :delete do
  file etcd_bin do
    action :delete
  end

  file etcdctl_bin do
    action :delete
  end
end

################
# helper methods
################

def file_cache_path
  Chef::Config[:file_cache_path]
end

def default_source
  "https://github.com/etcd-io/etcd/releases/download/v#{version}/etcd-v#{version}-linux-amd64.tar.gz"
end

def default_checksum
  case version
  when '3.5.7' then 'a43119af79c592a874e8f59c4f23832297849d0c479338f9df36e196b86bc396'
  when '3.4.24' then '8b2b35772704e67f956e6bac0fbb739d974155cd19602a00af9dc757a3a8f83d'
  when '3.3.19' then '9c9220002fb176f4d73492f78cab37c9bd8b5132b3ac6f14515629603518476d'
  when '3.2.17' then '0a75e794502e2e76417b19da2807a9915fa58dcbf0985e397741d570f4f305cd'
  when '3.2.15' then 'dff8ae43c49d8c21f9fc1fe5507cc2e86455994ac706b7d92684f389669462a9'
  when '3.2.14' then 'f77398f558ff19b65a0bf978b47868e03683f27090c56c054415666b1d78bf42'
  when '3.2.6' then '8186aa554c3eddfa16880fecc27f70bf24b57560d9187679a09331af651ea59c'
  end
end

def extract_etcd_cmd
  "tar xvf #{file_cache_path}/etcd-v#{version}-linux-amd64.tar.gz -C #{new_resource.etcd_bin_prefix} etcd-v#{version}-linux-amd64/etcd --strip-components=1"
end

def extract_etcdctl_cmd
  "tar xvf #{file_cache_path}/etcd-v#{version}-linux-amd64.tar.gz -C #{etcdctl_bin_prefix} etcd-v#{version}-linux-amd64/etcdctl --strip-components=1"
end
