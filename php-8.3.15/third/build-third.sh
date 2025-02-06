#!/bin/bash

export CC=/usr/bin/gcc
export CXX=/usr/bin/gcc
export CFLAGS="-g -O2 -fPIC"
export PATH=/usr/bin/gcc:$PATH

base_dir=$(cd `dirname $0` && pwd)
output_dir=$base_dir/.output
tmp_dir=$base_dir/.tmp

rm -rf $output_dir
rm -rf $tmp_dir
mkdir -p $output_dir
mkdir -p $tmp_dir

compile_iconv() {
    tar zxf ${base_dir}/libiconv-1.14.tar.gz -C ${tmp_dir}
    echo "Compiling iconv..."
    cat > $tmp_dir/build_iconv.sh <<SCRIPT
cd ${tmp_dir}/libiconv-1.14
./configure --prefix=${output_dir} --enable-static=yes --enable-shared=no
sed -i "s+GNULIB_GETS = 1+GNULIB_GETS = 0+g" srclib/Makefile
make
make install
SCRIPT
    sh $tmp_dir/build_iconv.sh > $tmp_dir/build_iconv.log
}

compile_freetype() {
    tar zxf ${base_dir}/freetype-2.9.1.tar.gz -C ${tmp_dir}
    echo "Compiling freetype..."
    cat > $tmp_dir/build_freetype.sh <<SCRIPT
cd ${tmp_dir}/freetype-2.9.1
./configure --prefix=${output_dir} --enable-shared=no
make
make install
ln -s ${output_dir}/include/freetype2/freetype/freetype.h ${output_dir}/include/freetype2/freetype.h
SCRIPT
    sh $tmp_dir/build_freetype.sh > $tmp_dir/build_freetype.log
}

compile_freetype_2(){
	tar zxf ${base_dir}/freetype_2-3-0-100.tar.gz -C ${output_dir}
	echo "compiling freetype_2-3-0-100"
}

compile_openssl() {
    tar zxf ${base_dir}/openssl-1.1.1.tar.gz -C ${tmp_dir}
    echo "Compiling openssl..."
    cat > $tmp_dir/build_openssl.sh <<SCRIPT
cd ${tmp_dir}/openssl-1.1.1
./config --prefix=${output_dir} --openssldir=${output_dir} shared
make
make install
SCRIPT
    sh $tmp_dir/build_openssl.sh > $tmp_dir/build_openssl.log
}

compile_openssl3() {
    tar zxf ${base_dir}/openssl-3.0.11.tar.gz -C ${tmp_dir}
    echo "Compiling openssl3..."
    cat > $tmp_dir/build_openssl3.sh <<SCRIPT
cd ${tmp_dir}/openssl-3.0.11
./config --prefix=${output_dir}/openssl --openssldir=${output_dir}/openssl
make
make install
SCRIPT
    sh $tmp_dir/build_openssl3.sh > $tmp_dir/build_openssl3.log
}


compile_libssh2() {
   tar zxf ${base_dir}/libssh2-1.11.1.tar.gz -C ${tmp_dir}
   echo "Compiling libssh2..."
   cat > $tmp_dir/build_libssh2.sh <<SCRIPT
cd ${tmp_dir}/libssh2-1.11.1
./configure --prefix=${output_dir} --with-crypto=openssl --with-libssl-prefix=${output_dir}/openssl
make
make install
SCRIPT
    sh $tmp_dir/build_libssh2.sh > $tmp_dir/build_libssh2.log
}

compile_zlib() {
    tar zxf ${base_dir}/zlib-1.2.11.tar.gz -C ${tmp_dir}
    echo "Compiling zlib..."
    cat > $tmp_dir/build_zlib.sh <<SCRIPT
cd ${tmp_dir}/zlib-1.2.11
./configure --prefix=${output_dir}/zlib-1.2.11
make
make install
SCRIPT
    sh $tmp_dir/build_zlib.sh > $tmp_dir/build_zlib.log
}

compile_libzip() {
    tar zxf ${base_dir}/libzip-1.2.0.tar.gz -C ${tmp_dir}
    echo "Compiling libzip..."
    cat > $tmp_dir/build_libzip.sh <<SCRIPT
cd ${tmp_dir}/libzip-1.2.0
./configure --prefix=${output_dir}/libzip --exec-prefix=${output_dir}/libzip --with-zlib=${output_dir}/zlib-1.2.11
make
make install
SCRIPT
    sh $tmp_dir/build_libzip.sh > $tmp_dir/build_libzip.log
}

compile_curl() {
    tar zxf ${base_dir}/curl-7.61.0.tar.gz -C ${tmp_dir}
    echo "Compiling curl..."
    cat > $tmp_dir/build_curl.sh <<SCRIPT
cd ${tmp_dir}/curl-7.61.0
./configure --prefix=${output_dir}/curl  \\
--with-libssh2 --with-libssh2=${output_dir} \\
--with-ssl=${output_dir}/openssl  \\
--with-zlib=${output_dir}/zlib-1.2.11
make
make install
SCRIPT
    sh $tmp_dir/build_curl.sh > $tmp_dir/build_curl.log
}

compile_libxml2(){
	tar zxf ${base_dir}/libxml2-2.9.10.tar.gz -C ${tmp_dir}
    echo "Compiling libxml2..."
    cat > $tmp_dir/build_libxml2.sh <<SCRIPT
cd ${tmp_dir}/libxml2-2.9.10
./configure --prefix=${output_dir} --disable-static \\
--with-history --with-python=/usr/bin/python3.6
make
make install
SCRIPT
    sh $tmp_dir/build_libxml2.sh > $tmp_dir/build_libxml2.log
}

compile_libpng(){
	tar zxf ${base_dir}/libpng-1.6.35.tar.gz -C ${tmp_dir}
     echo "Compiling libpng..."
     cat > $tmp_dir/build_libpng.sh <<SCRIPT
cd ${tmp_dir}/libpng-1.6.35
./configure --prefix=${output_dir} --enable-shared=no
make
make install
SCRIPT
	sh $tmp_dir/build_libpng.sh > $tmp_dir/build_libpng.log
}

compile_libjpg(){
	tar zxf ${base_dir}/libjpeg_6.tar.gz -C ${output_dir}
     echo "Compiling libjpg..."
}

cp -frp /usr/lib64/libldap* /usr/lib/
cp -frp /usr/lib64/libidn* /usr/lib/

#compile_iconv
##compile_freetype
#compile_freetype_2
#compile_openssl
compile_openssl3
mkdir -p ${output_dir}/openssl/lib/
cp -frp ${output_dir}/openssl/lib64/* ${output_dir}/openssl/lib/
compile_libssh2
compile_zlib
compile_libzip
compile_curl
compile_libxml2
#compile_libpng
#compile_libjpg

##tar zxf ${base_dir}/libxml2-2.6.30.tar.gz -C $output_dir
