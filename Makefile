TEMP_CONFIG := temp_openssl.cnf

all: generate-cert

generate-cert: conf/server.crt

conf/server.crt: localhost.openssl.cnf
	openssl req -x509 -out etc/nginx/conf.d/localhost.crt -keyout etc/nginx/conf.d/localhost.key \
	-newkey rsa:4096 -nodes -sha256 \
	-subj '/CN=localhost' -extensions EXT -config localhost.openssl.cnf -reqexts EXT -days 3650

.PHONY: all
