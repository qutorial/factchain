#NETWORK	= $(shell pwd | xargs basename)
NETWORK	= factchain
VERSION = 0.1.11
BNA 	= $(NETWORK)@$(VERSION).bna
BROWSER	= google-chrome

.PHONY: archive
archive:
	composer archive create -t dir -n .

.PHONY: clean
clean:
	rm -rf $(NETWORK)*.bna

.PHONY: ping
ping:
	composer network ping --card admin@$(NETWORK)

.PHONY: install-runtime
install-runtime: archive
	composer runtime install --card PeerAdmin@hlfv1 --businessNetworkName $(NETWORK)

.PHONY: start-network
start-network: archive
	composer network start --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw --archiveFile $(BNA) --file networkadmin.card

.PHONY: update-network
update-network: archive
	composer network update -a $(BNA) --card admin@factchain

.PHONY: import-card
import-card:
	composer card import --file networkadmin.card

.PHONY: delete-card
delete-card:
	composer card delete --name admin@factchain

.PHONY: hard-reset
hard-reset: archive install-runtime start-network delete-card import-card 

.PHONY: rest
rest:
	composer-rest-server -c admin@$(NETWORK) -n never -t false -w true -a false

.PHONY: explorer
explorer:
	$(BROWSER) http://localhost:3000/explorer/

.PHONY: generate-angular
generate-angular: rest
	yo hyperledger-composer:angular

.PHONY: playground
playground:
	composer-playground
