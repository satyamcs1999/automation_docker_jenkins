__<h1>Problem Statement</h1>__

<ul>

  <li>Create container image that has Jenkins installed using Dockerfile. </li>

  <li>When we launch this image, it should automatically start Jenkins service in the container. </li>

  <li>Create a Job chain of Job1, Job2, Job3 and Job4 using Build Pipeline in Jenkins. </li> 

  <li>Job1 : Pull the GitHub repo automatically when some developers push repo to GitHub. </li>

  <li>Job2 : By looking at the code or program file, Jenkins should automatically start the respective language interpreter installed image container to deploy code. </li>

  <li>Job3 : Test your app if it is working or not. If app is not working , then send email to developer. </li>

  <li>Create one extra Job i.e., Job4 for monitoring : If container where the app is running. fails due to any reason then this job should automatically start the container again. </li>

</ul>
