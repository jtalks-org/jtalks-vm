package "python-dev" do
 action :install
end

package "libmysqlclient-dev" do
 action :install
end

python_pip "jtalks-cicd" do
  action :install
end

