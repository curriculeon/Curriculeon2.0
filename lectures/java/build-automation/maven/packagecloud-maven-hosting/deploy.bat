@echo off
rd /s /q target
del dependency-reduced-pom.xml
dir

echo Fetching any potential remote changes...
git fetch --all
git pull --all

if not exist "./mvnw" (
  echo The file, "./mvnw", does not exist.
  echo Running "mvn -N wrapper:wrapper" to generate "./mvnw"...
  mvn -N wrapper:wrapper
)

echo Fetching project metadata...
for /f "delims=" %%v in ('./mvnw help:evaluate -Dexpression=project.version -q -DforceStdout') do set "project_version=%%v"
for /f "delims=" %%n in ('./mvnw help:evaluate -Dexpression=project.name -q -DforceStdout') do set "project_name=%%n"
for /f "delims=" %%g in ('./mvnw help:evaluate -Dexpression=project.groupId -q -DforceStdout') do set "project_groupId=%%g"
for /f "delims=" %%a in ('./mvnw help:evaluate -Dexpression=project.artifactId -q -DforceStdout') do set "project_artifactId=%%a"
for /f "delims=" %%v in ('./mvnw help:evaluate -Dexpression=project.version -q -DforceStdout') do set "project_version=%%v"
for /f "delims=" %%b in ('./mvnw help:evaluate -Dexpression=project.build.directory -q -DforceStdout') do set "project_build_directory=%%b"

set "package_cloud_username="
set "package_cloud_packagename="
set /p "package_cloud_username=Enter PackageCloud username: "
set /p "package_cloud_packagename=Enter PackageCloud package name: "

./mvnw package -Dmaven.test.skip=true
package_cloud push %package_cloud_username%/%package_cloud_packagename% .\target\%project_artifactId%-%project_version%.jar --coordinates=%project_groupId%:%project_artifactId%:%project_version%
