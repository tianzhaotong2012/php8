
re ##
- yum install -y gcc gcc-c++
- yum install -y autoconf
- yum install -y freetype-devel
- yum -y install ImageMagick-devel
- yum -y install libxml2 libxml2-devel
- yum install perl-IPC-Cmd #openssl need
- yum install openldap openldap-clients openldap-servers openldap-devel libpsl-devel -y #curl need
- yum -y install python36-devel # not found python3.6-config
- yum -y install libidn-devel libidn2-devel # Cannot find libraries for IDN support: IDN disabled
- yum -y install libidn2 #error while loading shared libraries: libidn2.so.0
- yum -y install libpsl-devel #error while loading shared libraries: libpsl.so.0
## Compile ##
- run sh local_build.sh
- cd output
## Install ##
- mv output/* [Destination]
- sh php-install-8.4.2.sh

