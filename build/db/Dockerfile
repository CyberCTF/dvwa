# The database of upstream's compose.yml (mariadb:10, pinned here to 10.11) with its environment
# values baked in: DVWA connects as dvwa / p@ssw0rd to the dvwa database.
FROM docker.io/library/mariadb:10.11
ENV MYSQL_ROOT_PASSWORD=dvwa \
    MYSQL_DATABASE=dvwa \
    MYSQL_USER=dvwa \
    MYSQL_PASSWORD=p@ssw0rd
