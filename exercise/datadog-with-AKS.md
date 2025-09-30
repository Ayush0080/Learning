# AKS configuration with datadog 


- created AKS cluster on Azure portal
![alt text](image-3.png)
![alt text](image-4.png)

- now installing Datadog agent on AKS via Helm
```bash
  # Add DataDog Helm repository
helm repo add datadog https://helm.datadoghq.com
helm repo update

# Create namespace
kubectl create namespace datadog

# Create secret with API key
kubectl create secret generic datadog-secret \
  --from-literal api-key=<YOUR_DATADOG_API_KEY> \
  --namespace datadog
  ```
  ![alt text](image-8.png)
  ![alt text](image-9.png)
  ![alt text](image-10.png)

- created dashboard for cluster


- created alert for high cpu utilization of node
![alt text](image-14.png)
![alt text](image-15.png)
![alt text](image-16.png)
![alt text](image-17.png)
![alt text](image-18.png)
