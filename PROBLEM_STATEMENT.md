__<h1>Problem Statement</h1>__

<ul>

  <li>Create container image that’s has Jenkins installed  using dockerfile. </li>

  <li>When we launch this image, it should automatically starts Jenkins service in the container. </li>

  <li>Create a job chain of job1, job2, job3 and  job4 using build pipeline plugin in Jenkins. </li> 

  <li>Job1 : Pull  the Github repo automatically when some developers push repo to Github. </li>

  <li>Job2 : By looking at the code or program file, Jenkins should automatically start the respective language interpreter installed image container to deploy code ( eg. If code is of  PHP, then Jenkins should start the container that has PHP already installed ). </li>

  <li>Job3 : Test your app if it  is working or not. If app is not working , then send email to developer with error messages. </li>

  <li>Create one extra job job5 for monitor : If container where app is running. fails due to any reson then this job should automatically start the container again. </li>

</ul>
