WHAT IS DOCKER?

  Docker 

WHAT IS DOCKER COMPOSE?

  It is a tool that helps you to run and manage multiple container applications.

HOW DO DOCKER AND DOCKER COMPOSE WORK?
  


1STEP: Establish SSH connection.

===== ?The reason for ssh connection is to be able to copy and paste information from the host to the virtual machine easily ==== 

1. Establish ssh connection from VM to WSL 2 environment and puTTY.
  - sudo apt install OpenSSH-server
2. Check if it is running
  - sudo systemctl status ssh
  - ![image](https://github.com/LukasKava/Inception/assets/111790658/a458966a-f1f7-410c-96e6-eec34d402e82)
  - it is going to look something like this.
3. Enable the ufw firewall by
  - sudo ufw enable
4. You want to open the sshd_config file and add your port.
  - sudo nano /etc/ssh/sshd_config
It will look something like this in my case I want to connect through 22 ports to the vm.
![image](https://github.com/LukasKava/Inception/assets/111790658/fe2315fd-22bc-400e-872c-a2eafbdaa4cb)
Then ctrl x; ctrl y; enter to save it.
5. Then allow the port through the ufw firewall by:
  - sudo ufw allow 22
6. To check if it was successful you can use sudo ufw status and you should see your port.
  ![image](https://github.com/LukasKava/Inception/assets/111790658/203f1e4a-60a9-47b1-b6b5-96e997126690)
7. After that you can go to vm settings > network > advanced > port forwarding 
  ![image](https://github.com/LukasKava/Inception/assets/111790658/24eab394-51da-43ac-bc88-638a488b248c)
    You want to add the guest port the port 22 that you have created and then for host another port.


====== Connecting to the VM through SSH  (Windows Putty) ===================
1. Open the Putty. For hostname in the usual case add localhost and for Port add the host port in my case 2222.
![image](https://github.com/LukasKava/Inception/assets/111790658/418c6eb2-8bea-49b2-ac77-c46a045b1e67)

2. You will arrive at the screen asking you to log in where you should put in the username and password of the VM
  ![image](https://github.com/LukasKava/Inception/assets/111790658/a5d583d2-4d05-41a4-bb81-3610895f2327)
  ![image](https://github.com/LukasKava/Inception/assets/111790658/543b6b1d-f615-44e0-9a50-bef95c3a46c2)

----- And you just successfully accessed the VM through SSH ------


====== Connecting to the VM through SSH  (WSL2) ===================
1. You want to check the file where you will see a nameserver of your wsl2 you have to use it instead of localhost.
     ![image](https://github.com/LukasKava/Inception/assets/111790658/7ac73aa4-a8a7-4121-a702-92ef55d7ebae)
2. To ssh connect to your virtual machine just type:
   - ssh klukas@172.31.112.1 -p 2222
![image](https://github.com/LukasKava/Inception/assets/111790658/535ef7e5-806e-48b1-adb2-2572b9322241)

----- And you just successfully accessed the VM through wsl2 ssh (P.S Just make sure you have OpenSSH installed from step 1) ------


2STEP: download and install git ===>
  1.  sudo apt install git to install git
  2.  Generate SSH key.
     -- ssh-keygen -t rsa
  3. cat /home/klukas("your username")/.ssh/id_rsa.pub and copy your public key to GitHub >> Settings >> SSH and GPG keys
     
----- And now voila you connected your GitHub with your VM and the same has to be done for school git -----------------------------


3STEP: get the docker engine in your VM for my virtual machine I use Ubuntu so I followed the instructions on how to install docker-engine using apt from the official docker website:

  https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

4STEP: clone your Inception git repository.
