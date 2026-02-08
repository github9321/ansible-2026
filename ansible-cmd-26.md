Ansible
    1  cd .ssh
    2  ls
	shows authorized_keys
    3  cat authorized_keys
    4  pwd
    5  cd ..
	(~)
    6  ssh-keygen
	it will generate public and private key
    7  cd .ssh
    8  ls
    9  cat id_rsa.pub
	copy the public key of ansible server or control node and put into the vim (inside authorized_keys)
    10  ssh -i id_rsa ec2-user@10.0.0.22
	ansible server private key and vm ip(pub/pvt)
 	now you can access nodes from ansible server
     vm login inside ansible
        1  mkdir san
        2  ls
	3  rmdir san
	4  ls
    	5  exit	
   13  sudo yum update -y
   14  sudo yum install ansible -y
   15  ansible --version	
   16  mkdir ansible
   17  cd ansible
   18  vi all_vm
   19  vi project01
	edit created inventory details
   20  vi project02
   21  ls
	inside ansible folder shows the created inventory file

insted of using ansible playbook you can use this shellcmd to run ansible  
   22  ansible all -i all_vm -m shell -a "free -m"	 
   23 ansible all -i project02 -m shell -a "free -m"
   24  ansible all -i project01 -m shell -a "free -m"	   
   25  ansible all -i all_vm -m shell -a "sudo yum update -y"
   31  ansible all -i project01 -m shell -a "sudo yum install httpd -y"
   35  ansible all -i project01 -m shell -a "sudo systemctl start httpd && sudo systemctl enable httpd"

using playbook
   37  vi httpd.yml
	edit httpd playbook 		
   39  ansible-playbook -i project02  httpd.yml
   43  vi docker.yml
   44 ansible-playbook -i all_vm docker.yml

To remove the installed httpd or docker	
   47  ansible-playbook -i project02  docker_remove.yml
   48  ansible-playbook -i all_vm  docker_remove.yml
