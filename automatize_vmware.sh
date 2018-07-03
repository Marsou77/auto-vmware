#!/bin/bash

clear
echo "----------------------------------------------"
echo "Welcome to our Ansible VMWare script launcher"
echo "Please choose what scenario you want"
echo "----------------------------------------------"
echo "1 - Setup Datacenter, Cluster, Add ESXi Host, Create VM"
echo "2 - Create ONLY Datacenter"
echo "3 - Create ONLY Cluster"
echo "4 - Add ONLY ESXi Hosts"
echo "5 - Create ONLY VM"
echo ""
while :
do
	read -p "Your choice: " choice
	case $choice in
		1) 	ansible-playbook /opt/ansible/project/project_automation.yml -e @credential_vc.yml -e @vmware.yml --vault-password-file .vaultpass
			break;;
		2) 	ansible-playbook /opt/ansible/project/project_automation.yml -e @credential_vc.yml -e @vmware.yml --vault-password-file .vaultpass --tags "dc"
			break;;
		3) 	ansible-playbook /opt/ansible/project/project_automation.yml -e @credential_vc.yml -e @vmware.yml --vault-password-file .vaultpass --tags "cluster"
			break;;
		4) 	ansible-playbook /opt/ansible/project/project_automation.yml -e @credential_vc.yml -e @vmware.yml --vault-password-file .vaultpass --tags "hosts"
			break;;
		5)	ansible-playbook /opt/ansible/project/project_automation.yml -e @credential_vc.yml -e @vmware.yml --vault-password-file .vaultpass --tags "vm"
			break;;
		*)	echo "Wrong choice number";;
	esac
done
