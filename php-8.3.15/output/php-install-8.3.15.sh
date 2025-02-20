#!/bin/bash

set -e

old_dir=/home/work/php8-master/php-8.3.15/.tmp/install

new_dir=$(cd `dirname $0` && pwd)

tar xzf php-bin-8.3.15.tar.gz

# replace old dir to new dir
# TODO replace serialized file and binary executable

replace_text=(
    php/etc/php.ini
    php/etc/php-fpm.conf
    php/etc/ext
    php/include
    php/bin/check-conf
    php/sbin/php-fpm.sh
    php/bin/dbunit
    php/bin/pear
    php/bin/peardev
    php/bin/pecl
    php/bin/phar
    php/bin/php-config
    php/bin/phpdoc
    php/bin/phpize
    php/bin/phpunit
    php/bin/php_install
    php/lib/php/data/PhpDocumentor
    php/lib/php/pearcmd.php
    php/lib/php/peclcmd.php
    php/lib/php/PhpDocumentor/phpDocumentor
    php/lib/php/PHPUnit/Util/PHP.php
    php/man/man8/php-fpm.8
)

replace_serialized=(
    php/etc/pear.conf
    php/lib/php/.registry
)

cd $new_dir

process_text() {
    sed -i "s+$old_dir+$new_dir+g" $1
}

process_serialized() {
    local php=$new_dir/php/bin/php
    grep -P '^#' $1 > $1.new || true
    cat $1 | grep -Pv '^#' | $php -r '
        $a=file_get_contents("php://stdin");
        $a=unserialize($a);
        echo "<?php\n echo serialize("; 
        var_export($a); 
        echo ");";
        ' | sed "s+$old_dir+$new_dir+g" | $php >> $1.new
    mv $1.new $1
}

apply() {
    local param=$1
    for dir in ${param[*]}; do 
        if [[ -d $dir ]]; then
            local files=`grep $old_dir -l -rI $dir`
            if [[ $files != '' ]]; then
                for file in ${files[*]}; do
                    $2 $file
                done
            fi
        elif [[ -f $dir ]]; then
            $2 $dir
        fi
    done
}

apply "${replace_text[*]}" process_text
apply "${replace_serialized[*]}" process_serialized

echo "On first use, install php in $new_dir success."
