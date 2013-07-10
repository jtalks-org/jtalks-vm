curl -L https://www.opscode.com/chef/install.sh|bash
chmod 777 /var/chef
cd /var/chef
git clone https://github.com/jtalks-org/jtalks-vm.git
mkdir /etc/chef
echo "cookbook_path "/var/chef/jtalks-vm/cookbooks" > /etc/chef/solo.rb
