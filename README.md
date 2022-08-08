# Assessment_Predict

Instructions:
=============

**Terraform Code and Cluster Deployment:**

1. Have your own service account credentials key file.
2. Update/Replace the provider block with credentials file absolute path wherever it is needed.
3. Create a GCS bucket with name of your choice.
4. Update backend configuration with bucket details.
5. Have necessary/appropirate IAM roles are attached to the service account.
6. Have the complete code ready and perform below actions:
    terraform init
    terraform plan
    terraform apply
7. Once cluster is provisioned successfully then get the connectoin command (something like below)
   
   gcloud container clusters get-credentials <clustername> --zone <zone ID> --project <Project ID>
    
8. Launch cloudshell and login to the cluster with above command
  
**Postgres DB Deployment:**
  
9. Deploy the postgres db as below - 
   kubectl apply -f <filename.yaml>
    
10. Create firewall rule to allow the traffic on the nodeport(31115) (get the nodeport if you have not explicitely mentioned in the config)
    
    gcloud compute firewall-rules create gke-node-port --network=gke-network-interview       --allow tcp:31115,udp:31115
    
11. Once port is allowed and all the k8s objects are created then test the db connectivity from local machine(psql client to be installed)/cloud shell
    
    psql -h <Node External IP> -p 31115 -U piuser -d predictx (Password: Springisnice)
    
12. You can create the tables as you need to test
  
**Information:**


1. GKE Nodepool has been configured as minimum 1 and max 3. Please update according to your view point.
    
2. VPC & Subnets are created with some random CIDR ranges. Update according to your needs
    
3. Change the Terraform resource names if needed.

    
**Clean the deployment and cluster :**
    
1. kubectl delete -f <filename.yaml>
    
2. terraform destroy
