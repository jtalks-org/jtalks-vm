download_url = "http://repo.jtalks.org/content/groups/public/org/jtalks/poulpe/poulpe-web-view/0.20-SNAPSHOT/poulpe-web-view-0.20-20121206.043142-40.war"
war_file = "poulpe.war"

execute "create-db" do
  command "mysql -uroot -proot -e 'create database p_poulpe character set = utf8'"
  action :run
end


remote_file "/usr/share/tomcat/webapps/#{war_file}" do
    source "#{download_url}"
    mode "0644"
    action :create
end
