FLYWAY_VERSION = 11.10.4

## Install flyway for managing database scripts
flyway-symlink:
	sudo ln -sf /opt/flyway/flyway /usr/local/bin/flyway

flyway-clickhouse-driver:
	wget https://repo1.maven.org/maven2/com/clickhouse/clickhouse-jdbc/0.6.0/clickhouse-jdbc-0.6.0-all.jar 
	mkdir -p /opt/flyway/drivers
	mv clickhouse-jdbc-0.6.0-all.jar /opt/flyway/drivers/

flyway-install:
	wget https://github.com/flyway/flyway/releases/download/flyway-$(FLYWAY_VERSION)/flyway-commandline-$(FLYWAY_VERSION)-linux-x64.tar.gz
	tar -xzf flyway-commandline-$(FLYWAY_VERSION)-linux-x64.tar.gz
	sudo mv flyway-$(FLYWAY_VERSION) /opt/flyway
	sudo rm flyway-commandline-$(FLYWAY_VERSION)-linux-x64.tar.gz
	
flyway-auth:
	flyway auth -IAgreeToTheEula

flyway-uninstall:
	sudo rm -rf /opt/flyway
	sudo rm -f /usr/local/bin/flyway

migrate:
	flyway migrate

repair:
	flyway repair

flyway-all: flyway-install flyway-symlink flyway-clickhouse-driver

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