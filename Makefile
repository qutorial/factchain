NETWORK	= $(shell pwd | xargs basename)
VERSION = 0.1.11
BNA = $(NETWORK)@$(VERSION).bna

.PHONY: archive
archive:
	composer archive create -t dir -n .

.PHONY: install
install: archive
	composer runtime install --card PeerAdmin@hlfv1 --businessNetworkName $(NETWORK)

.PHONY: deploy
deploy: archive
	composer network start --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw --archiveFile $(BNA) --file networkadmin.card

.PHONY: import-network-admin
import-network-admin:
	composer card import --file networkadmin.card


.PHONY: clean
clean:
	rm -rf $(NETWORK)*.bna
