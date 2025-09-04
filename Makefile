## Install database & it's client utilities
clickhouse-install-deb-repo:
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
	curl -fsSL 'https://packages.clickhouse.com/rpm/lts/repodata/repomd.xml.key' | sudo gpg --dearmor -o /usr/share/keyrings/clickhouse-keyring.gpg
	
clickhouse-sign:
	ARCH=$$(dpkg --print-architecture); \
	echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg arch=$$ARCH] https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list > /dev/null
	sudo apt-get update

clickhouse-install-client:
	sudo apt-get install -y clickhouse-server clickhouse-client

clickhouse-start:
	sudo systemctl start clickhouse-server

clickhouse-stop:
	sudo systemctl stop clickhouse-server

clickhouse-status:
	sudo systemctl status clickhouse-server

clickhouse-install:
	$(MAKE) clickhouse-install-deb-repo
	$(MAKE) clickhouse-sign
	$(MAKE) clickhouse-install-client

deploy:
	$(MAKE) flyway-all
	$(MAKE) clickhouse-install
	$(MAKE) clickhouse-start

# Possible utilies being messed with here
upload-files:
	scp -r ../data dsm001@192.168.4.58:/home/dsm001/Desktop