#just for build images push into local registry
FROM akunisnice/pbspro-maya:onbuild

#install lib 
RUN  yum install -y wget gcc gdb strace gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype \
freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel \
 ncurses ncurses-devel curl curl-devel e2fsprogs patch e2fsprogs-devel krb5-devel libidn libidn-devel \
 openldap-devel nss_ldap openldap-clients openldap-servers libevent-devel libevent uuid-devel uuid \
 mysql-devel  inetutils-ping net-tools  automake autoconf libtool make  epel-release ansible  


# install pcre-8.39 and nginx-1.1.10
RUN  cd /usr/local/src &&  wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz  && tar -zxvf pcre-8.39.tar.gz  &&  cd pcre-8.39 && ./configure &&  make && make install  && cd /usr/local/src &&  groupadd  www && useradd -g  www www -s /bin/false  &&   mkdir /usr/local/nginx   &&   mkdir -p /data/logs/nginx  &&  chown www:www /data/logs/nginx -R   &&  yum install -y zlib-devel  &&   wget http://nginx.org/download/nginx-1.1.10.tar.gz && tar -zxvf nginx-1.1.10.tar.gz &&  cd nginx-1.1.10  && ./configure --user=www --group=www --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_realip_module  && make && make install

#set env
ENV NGINX_HOME /usr/local/nginx
ENV PATH $PATH:$NGINX_HOME/sbin
