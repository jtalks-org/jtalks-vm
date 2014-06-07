Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    # If you are using VirtualBox, you might want to enable NFS for shared folders
    # config.cache.enable_nfs  = true
  end
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = '11.12.8'
  end
end


Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.forward_port 8080, 4000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks', 'cookbooks-dependencies']
    #configuring soft that's going to be installed
    chef.json.merge!({
      :java => {
        "install_flavor" => "oracle",
        :oracle => {"accept_oracle_download_terms" => true},
        :jdk_version => "7"
       },
      :mysql=> {
        :client => { :version => "5.5.28" },
        :server_root_password => "root",
        :server_repl_password => "no_replication",
        :server_debian_password => "root"
      },
      :resolver => {
        :nameservers => ["8.8.8.8", "8.8.4.4"]
      }

    })
    #updating package caches to install fresh soft
    chef.add_recipe("resolver")
    chef.add_recipe("apt-get")
    chef.add_recipe("nginx")
    #installing software
    chef.add_recipe("java")
    chef.add_recipe("openssl::default")
    chef.add_recipe("mysql::server") #installs both client and server
    chef.add_recipe("tomcat7")
    chef.add_recipe("python::pip")
    chef.add_recipe("apt")
    chef.add_recipe("git")
    chef.add_recipe("jtalks::cicd")
  end
end
