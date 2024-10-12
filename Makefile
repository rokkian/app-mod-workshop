
SHELL := /bin/bash

build-docker:
	docker build -t my-php-app-docker .

# This works if the script is executed in the right folder.
# If not, you need to change '.' with another folder, could be app/, ../app/, and so on.
sample-deploy-invocation:
	gcloud run deploy my-php-app --source . --region europe-west8 --allow-unauthenticated