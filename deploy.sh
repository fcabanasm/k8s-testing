docker build -t fcabanasm/kubernetes-client:latest -t fcabanasm/kubernetes-client:$SHA -f ./client/Dockerfile ./client
docker build -t fcabanasm/kubernetes-server -t fcabanasm/kubernetes-server:$SHA -f ./server/Dockerfile ./server

docker push fcabanasm/kubernetes-client:latest
docker push fcabanasm/kubernetes-server:latest

docker push fcabanasm/kubernetes-client:$SHA
docker push fcabanasm/kubernetes-server:$SHA

kubectl apply -f k8s
kubectl set image deployments-server-deployment server=fcabanasm/kubernetes-server:$SHA
kubectl set image deployments-client-deployment client=fcabanasm/kubernetes-client:$SHA