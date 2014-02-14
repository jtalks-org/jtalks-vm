Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.auto_detect = true
    # If you are using VirtualBox, you might want to enable NFS for shared folders
    # config.cache.enable_nfs  = true
  end
end


Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.forward_port 8080, 4000

  config.vm.provision :chef_solo do |chef|
  #configuring soft that's going to be installed
    #chef.log_level = :debug    
    chef.json.merge!({
      :java => {
        :install_flavor => "oracle",
        :oracle => {"accept_oracle_download_terms" => true},
        :jdk_version => "7",
        :jdk => {
          :"7" => {
            :i586 => {
              :url => "http://download.oracle.com/otn-pub/java/jdk/7u25-b15/jdk-7u25-linux-i586.tar.gz",
              :checksum => "dd89b20afa939992bb7fdc44837fa64f0a98d7ee1e5706fe8a2d9e2247ba6de7"
            }
          }
        }
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
    chef.add_recipe("apt")
    #installing software
    chef.add_recipe("java")
    chef.add_recipe("openssl::default")
    chef.add_recipe("mysql::server") #installs both client and server
    chef.add_recipe("tomcat7")
    chef.add_recipe("python::pip")
    chef.add_recipe("git")
    chef.add_recipe("jtalks::cicd")
  end
end
