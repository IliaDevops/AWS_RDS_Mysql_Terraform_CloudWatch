This is an terraform project creates RDS Mysql database with mysql 5.7 for Versus app using terraform.

Contain configurations:
1. Using t2/.micro for instance sizing and also created using free tier configurations.
2. MySQL major version 5.7.41
3. Used default MySQL parameter and option groups
4. The database is created in permanent EKS VPC in a private subnet
5. Database has its own security group
6. Were used terraform and terraform best practices. (you will find the links in the additional information section)
7. Used modules to create the database.
8. Incorporated best practices when creating database - accordinly with Dev requirements of the project (you will find the link in the additional information section)
9. You could change database entries,regions and other variables in dev.tfvars/prod.tfvars files.
10. Automation creation of random password for database.

The project has following structure:
   
.
├── README.md
├── mysql
│   ├── mysql.tf
│   └── variables.tf
├── mysql-networking
│   ├── mysql-net.tf
│   ├── outputs.tf
│   └── variable.tf
└── root
    ├── dev.tfvars
    ├── main.tf
    ├── prod.tfvars
    ├── providers.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── terraform.tfstate.d
    │   └── prod
    └── variables.tf

<----------------------------------------------------------------------------------------------------------------------->

DEV ACCOUT CONFIGURATIONS:                     | PROD ACCOUT CONFIGURATIONS:

Backup config section, enable backups. = OFF   |     ON
Performance Insights enabled           = OFF   |     OFF
Multi-AZ.                              = OFF   |     ON
Deletion protection                    = OFF   |     ON
Final_snapshot                         = OFF   |     ON
Copy tags to snapshot                  = OFF   |     ON
Storage. Encryption.                   = OFF   |     ON
IAM DB authentication                  = OFF   |     ON
CloudWatch Logs                        = OFF   |     ON
Storage autoscaling                    = ON    |     ON
Create random passwd for db            = ON    |     ON

<------------------------------------------------------------------------------------------------------------------------>

STEP I:

1. Clone this repo using command:  git clone <Link>
2. Go to project folder: cd rds_mysql-versus_app_v2_sm , then cd root
3. Initialize terraform, command: terraform init
4. View Plan of dev or prod configs using command: terraform plan -var-file="dev.tfvars" or terraform plan -var-file="prod.tfvars"
5. Apply the plan using command: terraform apply -var-file="dev.tfvars" or terraform plan -var-file="prod.tfvars"
6. Everything is automatic. This will provision all needed aws resources
7. Destroy the resources command: terraform destroy

<------------------------------------------------------------------------------------------------------------------------>

STEP II

Make sure that everyhing setted up correct:

1. Go to AWS management console - RDS section and sheck configs. Go to VPC section to check created subnets.

1.2. Install mysql on EC2 in same VPC and run: mysql -h <AWS DNS endpoint> -u<name> -p<password> -P <port number> 
    In the DB run: SHOW DATABASES;

You should see:

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| innodb             |
| mysql              |
| performance_schema |
| sampledb           |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

1.3. Type the following command to exit from DB: exit

2. Also you can check it through k8s:

2.1. Log in your cluster
2.2. Create Service 
2.3. vim <filename>.yml

2.4. add inside the file and change the following information:

apiVersion: v1
kind: Service
metadata:
  name: psql-rds
spec:
  externalName: <AWS DNS endpoint>
  ports:
  - port: <port number>
    protocol: TCP
    targetPort: <port number>
  sessionAffinity: None
  type: ExternalName
 
2.5. Run command: kubectl apply -f  your created <filename>.yml
2.6. Insert, costomize and run following command: 
kubectl run -it --rm --image=mysql:5.7.41 --restart=Never mysql-client -- mysql -h <AWS DNS endpoint> -u<name> -p<password> -P <port number> 

If you don't see a command prompt, try pressing enter.

It will create test pod that live while connect to DB and will be terminated automatically when you log out. 

2.7. In the DB run: SHOW DATABASES;
You should see:

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| innodb             |
| mysql              |
| performance_schema |
| sampledb           |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

2.8. Type the following command to exit from DB: exit

<------------------------------------------------------------------------------------------------------------------------>

Addition information section.

Terraform — Best Practices:
https://developer.hashicorp.com/terraform
https://spacelift.io/blog/terraform-best-practices#1-use-remote-state
https://medium.com/devops-mojo/terraform-best-practices-top-best-practices-for-terraform-configuration-style-formatting-structure-66b8d938f00c


 Terraform: A Comprehensive Guide to Using tfvars with Modules: 
 https://saturncloud.io/blog/terraform-a-comprehensive-guide-to-using-tfvars-with-modules/#:~:text=In%20your%20tfvars%20file%2C%20define,defined%20in%20your%20module%20configuration.&text=Now%2C%20you%20can%20use%20the,variables%20using%20the%20var%20keyword.&text=Finally%2C%20apply%20the%20configuration%20using%20the%20terraform%20apply%20command.


AWS RDS MYSQL - Best Practices:
https://www.trendmicro.com/cloudoneconformity/knowledge-base/aws/RDS/


Information how you can keep secrets and how to manage them in terraform you can find use the links:
https://automateinfra.com/2021/03/24/how-to-create-secrets-in-aws-secrets-manager-using-terraform-in-amazon-account/

 https://spacelift.io/blog/terraform-secrets

<------------------------------------------------------------------------------------------------------------------------>