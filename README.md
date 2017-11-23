# Fact Chain

Amazing blockchain app to fight the fake news!

Using this blockchain based application it is 
possible to come to a consensus about facts.

News Agencies are the targetted clientelle.


## Install

### Hyperledger Playground

This sample can be used in the Hyperledger Composer Playground.

Clone this repository, run zip.sh, import news.bna into the
playground:

https://composer-playground.mybluemix.net/editor


### Local Composer

See the developer guide for Hyperledger Composer and the Makefile.

https://hyperledger.github.io/composer/tutorials/developer-tutorial.html

Install the required Composer development tools. Then:

```
make archive
make install-runtime
make start-network
make import-card
make ping
```

Then you can rund a REST server and explore the network:

```
make rest
# if you do not have google-chrome, correct the Makefile to your sensible-browser
make explorer
```

