#
# Cookbook Name:: petclinic
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
tomcat_service "petclinicserver" do
action :start
env_vars [{'JAVA_OPTS' =>
  '-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true '}]
end

remote_file '/opt/tomcat_petclinic/webapps/petclinic.war' do
#source 'http://your.artifactory.server:8081/path/to/petclinic/pettclinic-1.0.0-SNAPSHOT.war'
source 'http://localhost:8081/artifactory/libs-snapshot-local/org/springframework/samples/spring-petclinic/1.0.0-SNAPSHOT/spring-petclinic-1.0.0-20170110.180153-1.war'
owner 'tomcat_petclinicserver'
group 'tomcat_petclinicserver'
end

directory '/home/tomcat_petclinicserver' do
owner 'tomcat_petclinicserver'
group 'tomcat_petclinicserver'
mode 0755
end
