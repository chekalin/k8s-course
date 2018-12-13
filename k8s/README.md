Command to set up secret in the cluster for postgres password:
`kubectl create secret generic pgpassword --from-literal PGPASSWORD=password123`