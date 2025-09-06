deploy-base:
	cd environments/dev/base && terraform init && terraform apply -auto-approve

deploy-apps:
	cd environments/dev/applications && terraform init && terraform apply -auto-approve


tf-app-clean:
	rm -f environments/dev/applications/.terraform.lock.hcl
	rm -rf environments/dev/applications/.terraform

tf-base-clean:
	rm -rf environments/dev/base/.terraform
	rm -f environments/dev/base/.terraform.lock.hcl
	rm -rf environments/dev/base/.terraform