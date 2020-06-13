#!/bin/bash
echo "cd Hosted" >> temp_cmds

for d in *; do
	if [ $d != "node_modules" ]; then
		echo "put -r "$d >> temp_cmds
		# echo $d
	fi
done

echo "exit" >> temp_cmds

sftp -i ../WebsiteKeypair.pem -b temp_cmds ec2-user@ec2-18-130-186-140.eu-west-2.compute.amazonaws.com
rm temp_cmds