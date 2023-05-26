self-signed:
	mkdir ./ssl
	openssl genrsa -out ./ssl/private.key 2048
	openssl req -new -key ./ssl/private.key -out ./ssl/csr.pem \
		-subj "/C=US/ST=State/L=City/O=Organization/CN=example.com"
	openssl x509 -req -days 365 -in ./ssl/csr.pem -signkey ./ssl/private.key -out ./ssl/certificate.crt

build:
	docker build -t reverse-proxy .

run:
	docker run --rm -p 80:80 -p 443:443 --name reverse-proxy reverse-proxy

stop:
	docker stop reverse-proxy
