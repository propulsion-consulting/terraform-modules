FLYWAY_VERSION = 11.10.4

## Install flyway for managing database scripts
flyway-install:
	wget https://download.red-gate.com/maven/release/com/redgate/flyway/flyway-commandline/$(FLYWAY_VERSION)/flyway-commandline-$(FLYWAY_VERSION)-linux-x64.tar.gz
	tar -xzf flyway-commandline-$(FLYWAY_VERSION)-linux-x64.tar.gz
	sudo mv flyway-$(FLYWAY_VERSION) /opt/flyway
	sudo rm flyway-commandline-$(FLYWAY_VERSION)-linux-x64.tar.gz

flyway-export-path:
	export PATH=$$PATH:/opt/flyway/flyway

## Install database & it's client utilities
clickhouse-install-deb-repo:
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
	curl -fsSL 'https://packages.clickhouse.com/rpm/lts/repodata/repomd.xml.key' | sudo gpg --dearmor -o /usr/share/keyrings/clickhouse-keyring.gpg
	
clickhouse-sign:
	ARCH=$$(dpkg --print-architecture); \
	echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg arch=$$ARCH] https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list > /dev/null
	sudo apt-get update

clickhouse-install:
	sudo apt-get install -y clickhouse-server clickhouse-client

clickhouse-start:
	sudo systemctl start clickhouse-server

clickhouse-stop:
	sudo systemctl stop clickhouse-server