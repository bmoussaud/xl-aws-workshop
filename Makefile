generatexld:
	./xlw  --config config.yaml generate xl-deploy -o -p Applications/TrainingXLD -f trainingxld.yaml


applyxld:
	./xlw  --config config.yaml apply -v -f move2cloud/xebialabs.yaml


