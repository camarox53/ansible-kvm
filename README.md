# ansible-kvm
Repository that contains ansible playbooks that allow interaction with KVM


Goals of this project:
* Idea here is to create an entire infrastructure within KVM using ansible

* I would like to be able to provision a node to run the KVM infrastructure on from this playbook 

* I want to be able to create builders that are used to run the playbooks from 
	* Needs /etc/ansible/hosts and a couple packages 

* I want to be able to create and provision VM's from scratch onto the node 


Motivation: 
The motivation for this is going to be used to create an infrastructure used for cyber defense or systems 
admin trainingwithin KVM. I may expand this into just using docker for everything but KVM is what I am 
more familiar with so I figure that is a good place to start. 

Services I would like to include: 
* webserver
* nagios / sensu
* ldapprovider (Not super worried about ldap) 
* ldapconsumer (Not super worried about ldap) 
* loadbalancers (Not that important for now) 
* FTP Server (Used for cyber defense training)
* backupserver (Not that important)
* NFS Server 
* Client machines with automounted home directories over NFS 






Labs to Create: 
* Secure FTP from anonymous logon and restrict access as much as possible
* Setup FTP with a public side and a private side 
* Setup webserver with authentication through htpasswd 
* SSH w/keys and wo/keys
* Error log analysis
* iptables 
* ufw 
* identify incoming connections 
* Capture live memory
* Setup SMTP
* Removal of unneeded services 
* Create and enable new accounts
* Setup an ssh banner
* Incident response reports
* Setup a proxy 
* DNS
* Telnet 
* php my admin 
* ldap 
* word press
* tomcat 
* Postgres 
* postfix, sendmail 
* Change Service default passwords
* IDS
* 
