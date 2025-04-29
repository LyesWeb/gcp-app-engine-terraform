#!/bin/bash

# Exit on error
set -e

echo "Building Java application..."
mvn -f ../app/pom.xml clean package

echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve

echo "Deploying application to App Engine..."
gcloud app deploy ../app/target/hello-world-0.1.0.jar --appyaml=../app/src/main/appengine/app.yaml -q

echo "Deployment completed successfully!"
echo "You can access your application at: $(terraform output -raw app_url)"