# 参数定义
param(
    [String]$war
    [String]$tomcat_home
    )
# 通过环境变量获取tomcat地址
if ([String]::IsNullOrEmpty($tomcat_home) {
    $tomcat_home=$env:CATALINA_HOME
}

# 手动定义 Tomcat_Home
#$tomcat_home="D:\ntx\develop\apache-tomcat-8.5.51"

echo $tomcat_home

IF([String]::IsNullOrEmpty($tomcat_home))
{
	throw "not find Tomcat , please check Tomcat station"
}
Else
{
  echo "the tomcat station: $tomcat_home"
}

if ([String]::IsNullOrEmpty($war)) {
    throw "not find the war package"
}

#$webapps=-Join($tomcat_home,"\webapps")
$webapps=$tomcat_home+"\webapps"
echo $webapps

# 删除 webapps 里面的内容
echo "remove contents in webapps"
ls $webapps | rm -Force -Recurse

# 拷贝 war 包
echo "copy war into webapps"
copy $war $webapps

# 启动 tomcat
$startupbat=$tomcat_home+"\bin\startup.bat"
echo "run ..."
Invoke-Expression $startupbat
