#!/usr/bin/python

import os, sys, getpass, paramiko


def main(argv):
	if len(argv) == 2:
		if os.path.isfile(argv[1]):
			passw = getpass.getpass()
			try:
				user,server = argv[0].split('@')
			except ValueError:
				print "Remote server must be written in user@server format"
			
			ssh = paramiko.SSHClient()
			ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
			ssh.connect(server,username = user, password = passw)
			ssh.exec_command("mkdir ./eldo_temp")
			
			ftp = ssh.open_sftp()
			ftp.chdir('eldo_temp')
			ftp.put(argv[1],argv[1])
			stdin, stdout, stderr 	= ssh.exec_command("cd eldo_temp; eldo " + argv[1])
			for line in stdout.readlines():
				print line
			stdin, stdout, stderr 	= ssh.exec_command("ls eldo_temp")
			for line in stdout.readlines():
				ftp.get(line.split()[0],line.split()[0])
			ftp.close()
			
			ssh.exec_command("rm -Rf eldo_temp")
		else:
			print "File", argv[1], "doesn't exist in current path"
	else:
		print 'Usage: remote_eldos.py server@user netlist'
		sys.exit(2)
		
if __name__ == "__main__":
   main(sys.argv[1:])