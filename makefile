create-cluster:
	k3d cluster -p 8080:80@loadbalancer create ssi

delete-cluster:
	k3d cluster delete ssi

stop-cluster:
	k3d cluster stop ssi

start-cluster:
	k3d cluster start ssi

deploy:
	kubectl create -f https://github.com/kyverno/kyverno/releases/download/v1.13.2/install.yaml
	kubectl apply -f kyverno/
	kubectl apply -f k8s/

destroy:
	kubectl delete -f kyverno/
	kubectl delete -f https://github.com/kyverno/kyverno/releases/download/v1.13.2/install.yaml
	kubectl delete -f k8s/

run:
	$(MAKE) create-cluster
	$(MAKE) deploy
