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
install: archive
	composer runtime install --card PeerAdmin@hlfv1 --businessNetworkName $(NETWORK)

.PHONY: start-network
start-network: archive
	composer network start --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw --archiveFile $(BNA) --file networkadmin.card

.PHONY: import-card
import-card:
	composer card import --file networkadmin.card

.PHONY: rest
rest:
	composer-rest-server -c admin@$(NETWORK) -n never -t false -w true -a false

.PHONY: explorer
explorer:
	$(BROWSER) http://localhost:3000/explorer/
