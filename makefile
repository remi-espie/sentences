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
	$(MAKE) wait-for-kyverno
	kubectl apply -f kyverno/
	kubectl apply -f k8s/

destroy:
	kubectl delete -f kyverno/
	kubectl delete -f https://github.com/kyverno/kyverno/releases/download/v1.13.2/install.yaml
	kubectl delete -f k8s/

run:
	$(MAKE) create-cluster
	$(MAKE) deploy

wait-for-kyverno:
	@echo "Waiting for Kyverno to be available..."
	@until kubectl get pods -n kyverno | grep -m 1 'kyverno.*1/1.*Running'; do \
		sleep 2; \
	done
	sleep 10
	@echo "Kyverno is available."