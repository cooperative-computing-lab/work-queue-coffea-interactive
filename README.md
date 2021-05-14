# work-queue-coffea-interactive

This is a summary of work completed vs work needed to be done as well as what has been tried.

# What works

Currently, we are able to run the sample program 2 ways. You can use a work_queue_factory(currently configured) which will allow you to boot workers seamlessly inside the Jupyter notebook.

In addition, you could remove the work_queue_factory and boot up workers in a different terminal window. This will produce the same end result.

# What is next

Next, we need to figure out how to connect to the discXX.crc.nd.edu machines. This will allow us to use much more computing power to solve our problems which will make this example more interesting.

# What has been tried

MyBinder is finnicky when it comes to allowing connections. Currently, there are no ingress ports allowed and very few egress ports allowed([source](https://github.com/jupyterhub/mybinder.org-deploy/blob/master/mybinder/values.yaml#L48 "source")). Apparently they do not want people making these types of connections. Since that is exactly what we want to do, we have to try some workarounds. I experimented with netcat to create a connection. Unfortunately the IP address given with `curl ifconfig.me` seems to not be useful with an ncat connection.

Next, I tried using [ngrok](https://ngrok.com/ "ngrok") to establish a connection between my myBinder terminal and an ncat listener on a disc machine. Ngrok is a port forwarding service that facilitates opening up a port to the world through the use of a proxy. Basically, you run your program on a port, and then run ngrok and tell it to forward that same port. Then, on your other machine, you connect to the first machine using the URL and port given to you by ngrok.

This eventually worked but had interesting ramifications. Apparantly, the myBinder people do not want you to do this and even though I was using an allowed port(9418), they would shut down the container instance after an ever shrinking amount of time when I set up the connection. This made it hard to test if I would be able to run the workers on the disc machine and get a connection although I felt it was possible. As a result, we are going to need a different solution.

# What could we try

Prof Thain mentioned using SSH tunnelling. I did not investigate this because it was the end of the semester.
