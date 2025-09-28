VENV_DIR := .venv
PYTHON := python3
PIP := $(VENV_DIR)/bin/pip

venv: $(VENV_DIR)/bin/activate

$(VENV_DIR)/bin/activate:
	$(PYTHON) -m venv $(VENV_DIR)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

dev:
	mkdocs serve

deploy-base:
	cd environments/dev/base && sudo terraform init && sudo terraform apply -auto-approve

destroy-base:
	cd environments/dev/base && sudo terraform init && sudo terraform destroy -auto-approve

deploy-dbs:
	cd environments/dev/databases && sudo terraform init && sudo terraform apply -auto-approve

destroy-dbs:
	cd environments/dev/databases && sudo terraform init && sudo terraform destroy -auto-approve

deploy-apps:
	cd environments/dev/applications && sudo terraform init && sudo terraform apply -auto-approve

destroy-apps:
	cd environments/dev/applications && sudo terraform init && sudo terraform destroy -auto-approve

tf-app-clean:
	rm -f environments/dev/applications/.terraform.lock.hcl
	rm -rf environments/dev/applications/.terraform

tf-base-clean:
	rm -rf environments/dev/base/.terraform
	rm -f environments/dev/base/.terraform.lock.hcl
	rm -rf environments/dev/base/.terraform
