directory node['nginx']['default_root'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode "0755"
  recursive true
  action :create
end

cookbook_file "#{node['nginx']['default_root']}/index.html" do
  source "nginx/maintenance.html"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  "0644"
end

cookbook_file "#{node['nginx']['dir']}/sites-available/#{node['nginx']['forum_site']}" do
  source "nginx/jcommune.conf"
  owner node['nginx']['user']
  group node['nginx']['group']
  mode  "0644"
end

nginx_site node['nginx']['forum_site'] do
  enabled = true
end
