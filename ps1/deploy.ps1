# 通过环境变量获取tomcat地址
#$tomcat_home=$env:CATALINA_HOME

# 手动定义 Tomcat_Home
$tomcat_home="D:\ntx\develop\apache-tomcat-8.5.51"

echo $tomcat_home

IF([String]::IsNullOrEmpty($tomcat_home))
{
	throw "can not find Tomcat , please define the position of Tomcat"
}
Else
{
  echo "get tomcat: $tomcat_home"
}

#$webapps=-Join($tomcat_home,"\webapps")
$webapps=$tomcat_home+"\webapps"
echo $webapps

# 删除 webapps 里面的内容
echo "remove contents in webapps"
ls $webapps | rm -Force -Recurse

# 拷贝 war 包
echo "copy p4-web war"
copy .\NGCMP\p4-web\target\p4-web.war $webapps
echo "copy cloud job war"
copy .\NGCMP\cloud-job\target\cloud-job.war $webapps

# 启动 tomcat
$startupbat=$tomcat_home+"\bin\startup.bat"
echo "run ..."
Invoke-Expression $startupbat
