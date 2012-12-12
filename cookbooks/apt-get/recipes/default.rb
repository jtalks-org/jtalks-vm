# Updated the apt-get caches so that we can install the latest packages (e.g. MySQL)
execute "apt-get-update" do
  command "apt-get update"
end
