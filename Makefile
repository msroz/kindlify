CRYSTAL_BIN ?= $(shell which crystal)
OUTPUT_BIN ?= bin/kindlify
PREFIX ?= /usr/local
VERSION ?= 0.1.0
# OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:]')
# ARCH ?= $(shell uname -m)
TAR_GZ_FILE_NAME ?= kindlify-$(VERSION)-darwin-x86_64.tar.gz
TAR_DIR ?= bin/kindlify

test:
	$(CRYSTAL_BIN) spec

build: clear
	$(CRYSTAL_BIN) build --release -o $(OUTPUT_BIN) src/cli.cr $(CRFLAGS)

clear:
	rm -rf ./$(OUTPUT_BIN)

install: build
	mkdir -p $(PREFIX)/bin
	cp ./$(OUTPUT_BIN) $(PREFIX)/bin

tar:
	rm -rf ./bin/*
	$(MAKE) build
	mv $(OUTPUT_BIN) $(OUTPUT_BIN)_bin
	mkdir -p $(TAR_DIR)
	cp $(OUTPUT_BIN)_bin $(TAR_DIR)/kindlify
	cp README.md $(TAR_DIR)
	cp LICENSE $(TAR_DIR)
	cd bin && tar zcvf $(TAR_GZ_FILE_NAME) kindlify
	$(MAKE) sha

sha:
	openssl dgst -sha256 bin/$(TAR_GZ_FILE_NAME)

.PHONY: test build clear install
