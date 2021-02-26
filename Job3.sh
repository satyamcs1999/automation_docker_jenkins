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