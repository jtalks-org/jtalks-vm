jcommune_url = "http://repo.jtalks.org/content/groups/public/org/jtalks/jcommune/jcommune-web-view/0.20/jcommune-web-view-0.20.war"
war_file = "jcommune.war"

remote_file "/usr/share/tomcat/webapps/#{war_file}" do
    source "#{jcommune_url}"
    mode "0644"
    action :create
end

#file "/usr/share/tomcat/webapps/#{war_file}" do
#  content IO.read("/tmp/#{war_file}")
#end
