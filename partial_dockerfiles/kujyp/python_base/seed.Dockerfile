FROM centos:7

RUN yum install -y \
 zlib-devel openssl-devel libffi-devel \
 sqlite-devel readline-devel \
 && rm -rf /var/cache/yum

{{ python }}

CMD /bin/bash
