#!/usr/bin/env bash
docker build -t chekalin/multi-client:latest -t chekalin/multi-client:${SHA} -f ./client/Dockerfile ./client
docker build -t chekalin/multi-server:latest -t chekalin/multi-server:${SHA} -f ./server/Dockerfile ./server
docker build -t chekalin/multi-worker:latest -t chekalin/multi-worker:${SHA} -f ./worker/Dockerfile ./worker
docker push chekalin/multi-client:latest
docker push chekalin/multi-server:latest
docker push chekalin/multi-worker:latest
docker push chekalin/multi-client:${SHA}
docker push chekalin/multi-server:${SHA}
docker push chekalin/multi-worker:${SHA}
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=chekalin/multi-client:${SHA}
kubectl set image deployments/server-deployment server=chekalin/multi-server:${SHA}
kubectl set image deployments/worker-deployment worker=chekalin/multi-worker:${SHA}