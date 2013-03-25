package "python-dev" do
 action :install
end

package "libmysqlclient-dev" do
 action :install
end

python_pip "jtalks-cicd" do
  action :install
end

#copy default vagrant configuration from COOKBOOK/files
remote_directory "/home/vagrant/.jtalks" do
  source ".jtalks"
  files_owner "vagrant"
  files_group "vagrant"
  files_mode 00660
  owner "vagrant"
  group "vagrant"
  recursive true
  mode 00777
end
