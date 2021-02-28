__<h1>Automation using GitHub, Docker, Jenkins and Python</h1>__

![Docker_Jenkins](https://miro.medium.com/max/875/1*7sF3c21jxZ8BbxI3aFP3NA.jpeg)<br>

<br><br>
<p>Today ,in this dynamic and ever changing world . automation has been a key component , it solves majority of the Industrial Use Cases and the tools used for the same are <b>DevOps</b>.</p>
<p>In this project, the tools used are <b>Git</b>, <b>GitHub</b> , <b>Jenkins</b> and <b>Docker</b>, for Email notification are integrated using Python scripts.</p><br><br>

<h2>GitHub Setup</h2>
<p>In this job, the developer pushes the code into GitHub.</p>
<p>Initially , we have to set up our local repository in our respective local machine and it could be set up using <b>Git Bash</b>, in our case , we have set up folder named <b>“dockerfile_automation”</b> holding the program files. The commands to set up the same are as follows :</p>

```shell
mkdir dockerfile_automation/

cd dockerfile_automation/

vim merge_sort.py   # you can use notepad or any other text editor
```

<br>
<p>Before creating our own local repository , we first need to create an empty repository in GitHub , after creating , convert the existing directory i.e, dockerfile_automation and push the program file “merge_sort.py” to the GitHub Repository using the following commands :</p>

```shell
git init                                

git add * 

git commit -m "Python Program"

git remote add origin https://github.com/satyamcs1999/dockerfile_Jenkins.git

git push -u origin master
```

<br>
<p>For pushing the program files to our master branch in GitHub repository , we need to specify “git push -u origin master(only during first time) or git push”, but by using the the <b>hooks/</b> directory within <b>.git/</b>, we can modify it in such a way that it would commit and also push without specifying any separate command for the same, first of all we need to create a file named <b>“post-commit”</b> and script to be included are as follows :</p>

```shell
vim post-commit

#!/bin/bash

git push
```

<br>
<p>Similarly, Perl and Ruby program file has been pushed to the GitHub Repository.</p>
<p>After this setup , GitHub would look like this:</p>

![GitHub_Repository](https://miro.medium.com/max/875/1*pvTwx7pAuAoDmJavdXypqg.png)

<br><br>

<h2>Docker and Jenkins Setup</h2>

<p><b>Part 1 :</b> Creation of Image using Dockerfile</p>
<p>In this case, we have used one of the two methods of creating our own image in Docker , first being “commit” and other being “Dockerfile”.</p>
<p>In the case of Dockerfile , more customized image could be formed easily than in case of “commit” .In this case , our <b>Dockerfile</b> looks like this.</p>

![Dockerfile](https://miro.medium.com/max/875/1*jD0wF9tV_O6rPpOxJG77nw.png)

<br>

<p><b>Part 2 :</b> Launching and Setup of Jenkins inside Docker Container</p>
<p>We launch Jenkins using Docker container whose image we’ve created using Dockerfile and the image name is <b>jenkins_dockerfile</b> with version <b>v1</b>.</p>

![Docker_command](https://miro.medium.com/max/875/1*2rXU47kSZ13h5oGgZAZqdg.png)

<p>Here, we have used the concept of <b>PAT (Port Address Translation)</b> , so that Jenkins inside our Docker container could be accessed using outside systems.</p>
<p>Also, the concept of <b>mount</b> has been used to bind necessary directories in Docker Container.</p>
<p>As soon as the above command starts executing , we get an <b>Administrator</b> password.</p>

![Administrator_password](https://miro.medium.com/max/875/1*ZQ99dOUSSKx7nUvoAAQ-5A.jpeg)

<br>
<p>As soon as we start Jenkins , it asks for the Administrator password.</p>

![Jenkins_1](https://miro.medium.com/max/875/1*MUXIwr3iGegLJxploFOQ9Q.png)

<br>
<p>After entering the Administrator password , when we click Continue , it asks for <b>Plugin Installation</b>.</p>

![Jenkins_2](https://miro.medium.com/max/875/1*yz57W8fXVDqMYS6sOJ70DQ.png)

<br>
<p>If you select the first option, it installs all the suggested Plugins, whereas in second option, it installs suggested plugins along with additional ones you select, in our case , I have added GitHub plugin for GitHub Integration with Jenkins.</p>
<p>After installation of Plugins, it would ask you to create you to add your details or else to continue as an admin.</p>

![Jenkins_3](https://miro.medium.com/max/875/1*dO31gfTQ0KOLO37y2m1LVQ.png)

<br>
<p>Then , it would ask you to add Jenkins URL or else you could skip the steps as well.</p>

![Jenkins_4](https://miro.medium.com/max/875/1*WnWvfzXITFn-ChhF4YWoAw.png)

<br>
<p>Now , the overall setup of Jenkins is completed.</p>

![Jenkins_5](https://miro.medium.com/max/875/1*_1G1ZHH0VWkmZDrm8c8srw.png)

<br>
<p>Click on <b>“Start using Jenkins”</b> and hence you’ve setup Jenkins inside Docker container.</p>
<br><br>

<h2>Jenkins Jobs</h2>

<p><b>Job 1 :</b> This job first pulls the code as soon as Jenkins detect changes in connected GitHub repo.</p>

![Jenkins_Job_1](https://miro.medium.com/max/875/1*8dh25OW-zNQj9z78Eckecw.png)

![Jenkins_Job_1_1](https://miro.medium.com/max/875/1*xbbvNnJNYs91DkPlJNYuIA.png)

<p>The triggers we use are GitHub hook triggers that could be setup by adding a webhook to our Github repo , and for creating webhook in our repo , we need a public URL that could be generated by using <b>ngrok</b>, which uses the concept of <b>Tunneling</b>.</p>

```shell
./ngrok http 8083
```

![ngrok](https://miro.medium.com/max/875/1*PGYMLy_V6PGzJd5sYSo8rw.png)

<p align="center"><b>Setting up Public URL using ngrok</b></p><br><br>

![webhook](https://miro.medium.com/max/875/1*JlcBLFpaHiUhgWUPknqreQ.png)

<p align="center"><b>Addition of Webhooks</b></p><br><br>

<p>The code used in this Job first detects the presence of a directory i.e. <b>code</b> in root directory, if not , it first creates it and place the program files inside the directory.</p>

![Job1_Code](https://miro.medium.com/max/875/1*5KtZeODBxiOlLaKm0uieYw.png)

<br>
<p align="center"><b>. . .</b></p><br>
<p><b>Job 2 :</b> This job detects the presence of programming language used in the file based on its extension, in our case , I have considered three of them namely Python, Perl and Ruby and it’s a <b>downstream</b> project of <b>Job 1</b> and <b>upstream</b> project for <b>Job 3</b>.</p>

![Job2_Code](https://miro.medium.com/max/875/1*Y012hpeX1nrvd3QngT6Dpg.png)

<br>
<p>This job creates a container if it detects file with extensions specified above , it means there is need of creating Docker container inside Docker container, but this method ain’t a good practice due to following reasons :</p>
<ol>
  <li>It doesn’t cooperate well with <b>Linux Security Modules (LSM)</b>.</li>
  <li>It creates a mismatch in file systems that creates problems for the containers created inside parent containers.</li>
</ol>
<p>So , instead of using the concept of creating <b>child container</b> inside <b>parent container</b> , by using the concept of <b>bind mount</b> i.e. by using .sock in the code that we used to launch the Docker container initially, we could create a <b>sibling container</b>, thereby eliminating the above issues .</p>

<br>
<p align="center"><b>. . .</b></p><br>
<p><b>Job 3 :</b> The primary goal of this Job is <b>Testing</b> ,also it sends an email if your app fails in testing . But before that , we need to install a plugin for the same i.e. <b>Python Plugin</b>.</p>

![Python_Plugin](https://miro.medium.com/max/875/1*BqPft6E94tRj7CTBpC0gHw.png)

<p align="center"><b>First plugin in the list shown</b></p><br><br>
<p>The reason behind the same is that we implement a Python script for sending email if the app fails in this case , also we implement Python Script inside Bash Script in this case . also it’s a <b>downstream</b> project for <b>Job 2</b>.</p>

```shell
if docker ps -a | grep interpreter
then
echo "Running"
exit 0
else
echo "Failed"

cat << EOF > pyscript.py
#!/usr/bin/python

import smtplib, ssl
port = 587  # For starttls
smtp_server = "smtp.gmail.com"
sender_email = ""  #Enter sender's email id
receiver_email = "" #Enter receiver's email id
password = "" #Enter sender's password
message = """\
Subject: Failed Job Notification

App ain't working as your job has failed"""

context = ssl.create_default_context()
with smtplib.SMTP(smtp_server, port) as server:
    server.ehlo()  # Can be omitted
    server.starttls(context=context)
    server.ehlo()  # Can be omitted
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, message)

EOF
chmod 755 pyscript.py
python3 ./pyscript.py

exit 1
fi
```

<br>
<b>The Email received in case the app fails is as follows:</b><br>

![Email](https://miro.medium.com/max/875/1*obON_hJ8FRzrTV2VHcywXg.png)

<p align="center"><b>Email Notification</b></p><br>
<br>
<p align="center"><b>. . .</b></p><br>
<p><b>Build Pipeline :</b> In this part , we use Build Pipeline Plugin to understand the overall flow of all 3 Jobs of Jenkins, but first we need to install <b>Build Pipeline</b> Plugin.</p>

![Build_Pipeline](https://miro.medium.com/max/875/1*W-9EB4ZDkFym50u5mmm3Tw.png)

<br>
<p>First click on <b>New View</b>.</p>

![Build_Pipeline_2](https://miro.medium.com/max/875/1*Xhx0bH6klIrE_vYTMSMwcA.png)

<br>
<p>Click on <b>Build Pipeline View</b> and give a name for the same.</p>

![Build_Pipeline_3](https://miro.medium.com/max/875/1*IdIjtYR2MAANFQTHau0xnQ.png)

<br>
<p>The page shown below appears and select options as per your requirements.</p>

![Build_Pipeline_4](https://miro.medium.com/max/875/1*FnirFuNOUnkUgPjsy8_-tw.png)

<br>
<p>After this , it provides visual representation of <b>Pipeline</b> as shown below.</p>

![Build_Pipeline_5](https://miro.medium.com/max/875/1*18mAHv6p7q7hH8VX6bFGww.png)

<br>
<p align="center"><b>. . .</b></p><br>

<p><b>Job 4 :</b> This particular job monitors over other every job and due to any chance , the container doesn’t launch due to some error , it launches it accordingly.</p>

![Job3_Code](https://miro.medium.com/max/875/1*4sfuyHq4Exqmj7hQROeLkQ.png)

<br>
<p align="center"><b>. . .</b></p><br>

![Jenkins_Dashboard](https://miro.medium.com/max/875/1*OGf04I7T9ELNSQvYkx6p_g.png)

<p align="center"><b>Jenkins Dashboard</b></p><br><br>

<br>
<p align="center"><b>. . .</b></p><br>
<h2>[Update]:</h2>
<p>In GitHub, master branch has been renamed to main branch, therefore before pushing the code to the GitHub repository, branch could be switched from master to main using the command mentioned below:</p><br>

```shell
git branch -M main
```

<br>
<p align="center"><b>. . .</b></p><br>
<h2>Thank You :smiley:<h2>
<h2>2inkedIn Profile</h2>
https://www.linkedin.com/in/satyam-singh-95a266182

<h2>Link to the repository mentioned above</h2>
https://github.com/satyamcs1999/dockerfile_Jenkins.git

