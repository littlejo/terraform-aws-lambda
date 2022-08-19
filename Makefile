before-commit:
	terraform-docs md . > README.md
	terraform fmt
