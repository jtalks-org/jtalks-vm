Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.forward_port 8080, 4567

  config.vm.provision :chef_solo do |chef|
  #configuring soft that's going to be installed
    chef.json.merge!({
      :java => {
        "install_flavor" => "oracle",
        :oracle => {"accept_oracle_download_terms" => true}
       },
      :mysql=> {
        :client => { :version => "5.5.28" },
        :server_root_password => "root",
        :server_repl_password => "no_replication",
        :server_debian_password => "root"
      }
    })
    #updating package caches to install fresh soft
    chef.add_recipe("apt-get")
    #installing software
    chef.add_recipe("java") #OpenJDK is default
#    chef.add_recipe("build-essential")
#    chef.add_recipe("ruby_build")   
 #   chef.add_recipe("rbenv")   
#    chef.add_recipe("unicorn")   
#    chef.add_recipe("runit")   
#    chef.add_recipe "rails-lastmile"
    chef.add_recipe("openssl::default")
    chef.add_recipe("mysql::server") #installs both client and server
    chef.add_recipe("tomcat7")
 #   chef.add_recipe("jtalks::jcommune")
  #  chef.add_recipe("jtalks::antarcticle")
    chef.add_recipe("jtalks::poulpe")
  end
end
