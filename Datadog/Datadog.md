# Datadog Monitoring

 - Monitoring : monitoring is like keeping a close eye on your systems and applications to make sure they are healthy and working correctly.


 #### Monitoring Terminologies
- Metrics and Events 

   - Metric: A numerical measurement of a system's health or performance over time. Metrics are time-stamped, allowing you to track trends. For example, CPU usage (e.g., 75%), request count (e.g., 500 requests/minute), or disk I/O.
      1. Work metrics : 
         - throughput - no of request per second
         - Success rate - % request success
         - Error rate - % request failed
         - Performance - respod time 

     2. Resource metrics :  
        - utilizatiom - % time that device was busy
        - saturation -   swap usage 
        - availability - % time resource responded to request
        - Errors - internam error or decvice error

  - Event: A discrete record of an activity or occurrence. Unlike metrics, events are not necessarily numerical. They capture what happened at a specific point in time. Examples include a server reboot, a user login, or an error message.

  - Log: A timestamped collection of events. A log is essentially a diary of everything that happens in a system. They are crucial for deep-dive troubleshooting and auditing.

- Alerts and Dashboards

  - Alert: A notification that is automatically triggered when a specific condition or rule is met. Alerts are based on metrics or logs. For example, an alert might be triggered if a server's CPU usage is above 90% for more than 5 minutes.

  - Dashboard: A visual interface that displays monitoring data in an easy-to-understand format, typically using charts, graphs, and gauges. Dashboards provide a real-time, at-a-glance overview of a system's health and performance.

  - Baseline: The normal or expected behavior of a system. By establishing a baseline, you can identify when a system is behaving abnormally (e.g., a server's typical CPU usage is 20%, so anything above 50% is a potential issue).

  - Incident: An unplanned interruption or reduction in the quality of a service. Monitoring helps you detect incidents so they can be addressed quickly.

  - Threshold: A predefined value that, when crossed, triggers an alert. For example, a threshold of 90% CPU usage or 500 HTTP errors per minute.



- DogstatsD an implementation of StasD protocol is a metrics aggregation service bundled with Datadog Agent to send custom metrics from your application to Datadog backned.
   

- created tow VM on Azure portal 1.windows based VM and 2. ubuntu based VM

     - now installing datadog agent into both two vm's
       
       1. go to Azure portal > VM > setting > Extensions + applications
          ![alt text](image.png)
          ![alt text](image-1.png)

       2. provide Datadog API Key 
          ![alt text](image-2.png) 
          ![alt text](image-3.png)

       3. now logined to windows server and able to show to datadog agent running on it (Datadog ui agent eunning on 5002 port and it by default enabled for Windows 64 and Mac OS, and If we have installed the Ubuntu data dog agent, then this agent manager gui is disabled there.)
       ![alt text](image-4.png) 
       - in ubuntu Vm
         ![alt text](image-6.png) 

       4. VM reporting on Datadog website
         ![alt text](image-5.png)

       5. The collector status page displays details on the agents Running checks like for CPU status etc.
         ![alt text](image-7.png)  

####  Tags in Datadog 
   - Tagging in Datadog is a crucial feature that allows you to organize, filter, and aggregate monitoring data from your infrastructure, applications, and services. Tags are key-value pairs that you attach to your metrics, logs, and traces to provide context and metadata.

      - Think of tags as labels that help you slice and dice your data. Instead of just seeing a single "CPU usage" metric, you can see the CPU usage for service:web-frontend or env:production. This helps you easily find what you're looking for and troubleshoot issues more efficiently.

   - How Tags Are Used
       - Filtering: You can filter dashboards and graphs to show data only for a specific tag. For example, you can build a dashboard that shows the performance of all your hosts in the region:us-east-1.

      -  Grouping and Aggregating: Tags allow you to group related data. You can group metrics by host, service, version, or any other tag to see aggregated performance across a specific dimension.

      - Searching: When searching through logs or traces, tags allow you to quickly narrow down your search results. For example, you can search for all logs from a specific container_id or user_id.

      - Alerting: You can create more granular and targeted alerts using tags. For example, you can set up an alert that only notifies you if the CPU usage is high for a specific team, like team:billing.   

   - Key Reserved Tags
     -  host: Identifies the host or server where the data originated. This is a fundamental tag for Datadog's infrastructure monitoring.

     - device: Used to distinguish between different devices on the same host, such as a disk drive.

     - service: Represents a logical service or application. This is a crucial tag for monitoring microservices and is often used for APM (Application Performance Monitoring).

     - env: Short for environment, this tag is used to differentiate between production, staging, development, and other environments.

     - version: Specifies the version of the application or service. This is especially useful for tracking performance changes after a new deployment.

     - container_id: Automatically collected from containerized environments (like Docker and Kubernetes) to identify specific containers.

     - pod_name: Used to identify Kubernetes pods.

     - kube_cluster_name: Identifies the Kubernetes cluster.

     - gcp_project_id: Used to identify the Google Cloud Platform project.

     - aws_account_id: Identifies the AWS account.

     - azure_subscription_id: Identifies the Azure subscription.

     - added tags using Ui 

     ```bash 
          system:WindowaVm
     ```     
     ![alt text](image-8.png) 

  - Filtering,Grouping on Tags 
     ![alt text](image-9.png)  

  - added tags using datadog.yaml file 
     - go to Datadog Agent Manager >setting > add tages > save > and restart agent
    ![alt text](image-10.png)  
    ![alt text](image-11.png) 
    ![alt text](image-15.png)


- Monitoring Processes :
   -  live processes collection is disabled by default 
      ![alt text](image-12.png)
   
   - we need to enable it by editing the agent's main configuration file that is Datadog.YAML file. then save and restart the agent
      ![alt text](image-13.png)
      ![alt text](image-14.png)
      ![alt text](image-16.png)

-  Scrubbing Sensitive data : the process of removing or masking personally identifiable information (PII) and other confidential details from your telemetry data (logs, metrics, traces, and RUM sessions) before it's sent to or stored in Datadog.
``` bash 
    # how to enable Scrubbing : go to the data agent manager and enable
     scrub_args: true
     custom_sensitive_words: ['type','user*' ]
```

#### Monitoring Containers

 - created Containers on vm to monitoring and installing datadog agent into it.
   ![alt text](image-17.png)
   ![alt text](image-18.png)
   ![alt text](image-19.png)

#### Metrics and Metrics Views in Datadog

 - metric types :
   1. Count : count Represents the total number of event occurrences in one time interval 
       - EX : total no of connection made to a database. 
   2. Rate :  Represents the total number of event occurrences in the given time interval.
       - Rate = total count in the interval / length of the time interval.
   3. Gauge : takes the last value resported in the interval.
       - EX : use for measuring current memory usage, current temperature
   4. sets :  count the number of unique values passed to a key. 
   5. Histogram : separates data into predefined "buckets" and counts how many observations fall into each bucket. This allows you to answer questions like:
       - Ex : What percentage of requests finished in under 200ms?, What is the 95th percentile latency for a specific API endpoint?

       ![alt text](image-20.png)

#### Notebooks
- Datadog Notebook is a collaborative, rich-text document that combines live monitoring data with explanatory text. It's designed to help teams perform in-depth analysis, troubleshoot issues, and document their findings in a single, shareable format. Unlike a dashboard, which provides a high-level, real-time view, a notebook is more of a "story" or a "report."

   - Notebook is more of a utility to create a custom page of and number of cells where each cell can have a metric graph or some markdown content or some comments or text anything.

   - created new notebooks go to the datadog>Dashboards>notebook
     ![alt text](image-21.png)

   - graph snapshot means to take a static image of a graph with a fixed time range.For example, a snapshot of graph from 2 p.m. to 4 p.m..
    ![alt text](image-22.png)  
   
  - types of notebook 
    ![alt text](image-23.png) 


#### Dashboards 

- Dashboards is a feature that lets you view, analyze, track and display data from different sources in the same context.


    - created Dashboard 
      ![alt text](image-24.png)
      ![alt text](image-25.png)
      ![alt text](image-26.png)
    - Grouping the dashboard 
      ![alt text](image-27.png)  

    - check statues
      ![alt text](image-28.png)


#### Monitors and Alerts

-  one or more hosts are reporting to Datadog(service check =  datadog.agent.up)

  - created monitor for if host data is missing for more than 2 minutes.
    ![alt text](image-29.png)
    ``` bash
        
      {{#is_match "host.name" "Datadog1" }}
      Hi Team {{host.name}} is down. Please check and fix the issue @ayush.sakhiya@einfochips.com

       {{else}}
       Hi Team {{host.name}} is down. Please check and fix the issue @prod@gmail.com
       {{/is_match}}
       @xyz@gmail.com
     

  

        











![alt text](image-30.png)    
![alt text](image-31.png) 
![alt text](image-32.png)
![alt text](image-33.png)
![alt text](image-34.png)

- Schedule Downtime
  ![alt text](image-35.png)
  ![alt text](image-36.png)
  ![alt text](image-37.png)
  ![alt text](image-38.png)


  #### Log Collection
- log is detailed list of events that happen within the system/application

   -  required to collect logs from Apache on ubuntu vm 

   1. Edit the apache.d/conf.yaml file in the conf.d/ folder at the root of your Agent's configuration directory to start collecting your Apache metrics. See the sample apache.d/conf.yaml for all available configuration options.
   ![alt text](image-41.png)

   2. Add this configuration block to your apache.d/conf.yaml file to start collecting your Apache logs, adjusting the path and service values to configure them for your environment
   ![alt text](image-42.png)
   3. Collecting logs is disabled by default in the Datadog Agent. Enable it in datadog.yaml:
   ![alt text](image-43.png)
   ![alt text](image-46.png)
   4. Restart the Agent.
      ![alt text](image-45.png)
      ![alt text](image-54.png)


#### APM (Application Performance Monitoring)


- spam - single operation like a database query or an http call.
     - each span contains metadata like latency,http,method,error codes,host info
- Trace - A collection of spans grouped under a single request is called a trace.


  - installed docker , dockercompos,git in to VM
  - and run easytrade application on Vm and installed datadog agent for docker
  - [https://github.com/Dynatrace/easytrade] 
  ![alt text](image-47.png)
  ![alt text](image-48.png)
  ![alt text](image-49.png)
  - now restarted application
   ![alt text](image-50.png)
   ![alt text](image-51.png)
  - now services are reporting on datadog
   ![alt text](image-52.png) 
   ![alt text](image-53.png)


#### Real user monitoring (RUM)

- captures and analyzes transactions done by users on a website or application

![alt text](image-55.png)
![alt text](image-56.png)




#### Account Management for admin 
![alt text](image-57.png)
![alt text](image-58.png)

- Audit trail events help with compliance checks and maintaining audit trials of who did what and when.
![alt text](image-59.png)
