deploy-base:
	cd environments/dev/base && sudo terraform init && sudo terraform apply -auto-approve

destroy-base:
	cd environments/dev/base && sudo terraform init && sudo terraform destroy -auto-approve

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