EXECUTABLE_NAME := dt
INSTALL_PATH := /usr/local/bin

all: build install

build:
	swift build --configuration release

install: build
	@echo "🚀 Installing $(EXECUTABLE_NAME)..."
	sudo cp -f .build/release/$(EXECUTABLE_NAME) $(INSTALL_PATH)/$(EXECUTABLE_NAME)
	sudo chmod +x $(INSTALL_PATH)/$(EXECUTABLE_NAME)
	@echo "$(EXECUTABLE_NAME) installed at $(INSTALL_PATH)/$(EXECUTABLE_NAME)"

link: install
	@echo "🧐 Creating a symbolic link to $(EXECUTABLE_NAME) in the current directory..."
	@ln -s $(INSTALL_PATH)/$(EXECUTABLE_NAME) $(EXECUTABLE_NAME)
	@echo "Symbolic link created in the current directory"

uninstall:
	@echo "😞 Uninstalling $(EXECUTABLE_NAME)..."
	sudo rm -f $(INSTALL_PATH)/$(EXECUTABLE_NAME)
	@rm -f $(EXECUTABLE_NAME)
	@echo "$(EXECUTABLE_NAME) uninstalled"

clean:
	swift package clean

.PHONY: all build install link uninstall clean
