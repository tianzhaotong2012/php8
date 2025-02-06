## Prepare ##
- yum install -y gcc gcc-c++
- yum install -y autoconf
- yum install -y freetype-devel
- yum -y install ImageMagick-devel
- yum -y install libxml2 libxml2-devel
- yum install perl-IPC-Cmd #openssl need
- yum install openldap openldap-clients openldap-servers openldap-devel libpsl-devel -y #curl need
## Compile ##
- run sh local_build.sh
- cd output
## Install ##
- mv output/* [Destination]
- sh php-install-8.4.2.sh

