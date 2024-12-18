create-cluster:
	k3d cluster create ssi

delete-cluster:
	k3d cluster delete ssi

stop-cluster:
	k3d cluster stop ssi

start-cluster:
	k3d cluster start ssi

deploy:
	helm repo add kyverno https://kyverno.github.io/kyverno/
	helm repo add falcosecurity https://falcosecurity.github.io/charts
	helm repo update
	helm install kyverno kyverno/kyverno -n kyverno --create-namespace
	helm install falco falcosecurity/falco -n falco --create-namespace
	echo "Waiting for kyverno and falco to be ready..."
	sleep 30
	kubectl apply -f kyverno/
	kubectl apply -f k8s/

destroy:
	kubectl delete -f kyverno/
	helm uninstall kyverno -n kyverno
	helm uninstall falco -n falco
	kubectl delete -f k8s/

run:
	$(MAKE) create-cluster
	$(MAKE) deploy
