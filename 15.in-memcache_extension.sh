#!/bin/bash
cd libs
tar zxfv memcache-2.2.7.tgz
cd memcache-2.2.7
/server/php5.3/bin/phpize --with-php-config=/server/php5.3/bin/php-config
 ./configure
make && make install
cd ..
rm -rf cd memcache-2.2.7
if [ -f "/server/php5.3/lib/php/extensions/no-debug-non-zts-20090626/memcache.so" ];then
    echo "[memcache]">/server/php5.3/etc/conf.d/memcache.ini
    echo "extension=memcache.so">>/server/php5.3/etc/conf.d/memcache.ini
    /server/php5.3/bin/php -m
fi
echo "done."
