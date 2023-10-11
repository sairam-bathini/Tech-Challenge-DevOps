# Cloud_Engineering-DevOps-Tech-Challenge
# Challenge 1: 3 Tier Environment using AWS
Please find the text document AWS-CLI-Commands.txt for AWS CLI commmands which need to execute to create a 3-Tier-Application.
And for installing running an Apache web server use Apache-install-run-web-server.sh file.
Finally use the AMI-For-Deployment.txt commands to run the faster deployment using AMI.

Instead of using the AWS Management Console, We’re going to do all of this programmatically, through the AWS Command Line Interface (CLI).

Steps we’ll take
Install and configure the AWS CLI.
Create our EC2 environment by creating a VPC, Key pair, and Security Group.
Write a bash script that will update all packages and install an Apache web server on our EC2 instance.
Launch the EC2 instance that will run our apache-install script.

Prerequisites:
An AWS account with an IAM user and an access key/secret access key.
Basic knowledge of the Linux OS and commands.
Basic knowledge of bash scripting.
Basic knowledge of an Amazon EC2 instance.
Access to a command line terminal or shell.

# Challenge 2: Code that will query the meta data of an instance within AWS environment and provide a json formatted output.
To query the metadata of an EC2 instance within AWS and provide a JSON-formatted output, you can use the instance metadata service provided by AWS. The metadata service is accessible from within an EC2 instance, and it provides information about the instance itself.

Save the script (get_instance_metadata.sh) to a file, make it executable, and run it with the desired key as an argument. It will retrieve the specified key and format it as a JSON object.

That's it! You now have a way to query the metadata of an AWS EC2 instance and format the output as JSON, with the bonus ability to retrieve specific data keys individually.

# Challenge 3: Nested Object Value Retrieval
Save the script to a file (extract_value.sh), make it executable using chmod +x extract_value.sh, and then run it. It will parse the nested objects and return the values associated with the specified keys.
