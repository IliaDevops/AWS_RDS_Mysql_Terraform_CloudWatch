This is an terraform project that configure Cloudwatch alarms to trigger on high CPU usage (above 80%(adjustable)) for Exchange and Versus DB.

Project structure.

.
├── README.md
├── alarm
│   ├── alarm.tf
│   └── variables.tf
├── exchange-postgres
│   ├── dev.tfvars
│   ├── main.tf
│   ├── prod.tfvars
│   ├── providers.tf
│   └── variable.tf
└── versus-mysql
    ├── dev.tfvars
    ├── main.tf
    ├── prod.tfvars
    ├── providers.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    └── variable.tf

<------------------------------------------------------------------------------------------------------------------------>
Note: before you start please check that you put correct DB_identifier_id for database that you want to monitoring, an email for  AWS SNS and and other general settings in the relative files .


Instruction:
1. Clone this repo using command: git clone
2. Go to project folder: cd CloudWatch-Alarms-RDS, then choose folder with database that you want apply an allarm:  cd  exchange-postgres/versus-mysql.
3. Initialize terraform, command: terraform init
4. View Plan of dev or prod configs using command: terraform plan -var-file="dev.tfvars" or terraform plan -var-file="prod.tfvars"
5. Apply the plan using command: terraform apply -var-file="dev.tfvars" or terraform plan -var-file="prod.tfvars"
6. Everything is automatic. This will provision all needed aws resources
7. Destroy the resources command: terraform destroy

<------------------------------------------------------------------------------------------------------------------------>
There a lot of different solution to run the test. There is one simple CPU load test for database.

Move to your database and run the following commands:

SHOW DATABASES;
CREATE DATABASE test;
USE test;
SHOW TABLES;
create table t1(x int primary key auto_increment);
insert into t1 () values (),(),();
insert into t1 (x) select x + (select count(*) from t1) from t1; #repeat the following command several times until overload the database
DROP TABLE t1; #delete the table

<------------------------------------------------------------------------------------------------------------------------>

Addition information section:

Monitor AWS via the Terraform Cloudwatch Module:
https://adamtheautomator.com/terraform-cloudwatch/

https://hands-on.cloud/terraform-cloudwatch-examples/

Terraform: A Comprehensive Guide to Using tfvars with Modules: https://saturncloud.io/blog/terraform-a-comprehensive-guide-to-using-tfvars-with-modules/#:~:text=In%20your%20tfvars%20file%2C%20define,defined%20in%20your%20module%20configuration.&text=Now%2C%20you%20can%20use%20the,variables%20using%20the%20var%20keyword.&text=Finally%2C%20apply%20the%20configuration%20using%20the%20terraform%20apply%20command.

Terraform — Best Practices: https://developer.hashicorp.com/terraform https://spacelift.io/blog/terraform-best-practices#1-use-remote-state https://medium.com/devops-mojo/terraform-best-practices-top-best-practices-for-terraform-configuration-style-formatting-structure-66b8d938f00c

