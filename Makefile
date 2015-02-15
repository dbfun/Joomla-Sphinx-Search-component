COM_NAME = com_sphinxsearch
ARCHIVE_FNAME = archive/$(COM_NAME)_$(shell date +%Y%m%d_%H%M).tar.bz2

.PHONY: package clean archive help
package: clean
	test -d build || mkdir build
	cp -a $(COM_NAME) build/$(COM_NAME)
	find build/$(COM_NAME) -type d -not -path build/$(COM_NAME) -exec cp build/$(COM_NAME)/index.html {} \;
	cd build/$(COM_NAME);zip -r ../$(COM_NAME).zip . -x \*.swp -q --archive-comment < ../../README.md
	rm -rf build/$(COM_NAME)
	@echo -e "\n\n# Finished"
	@echo "=========="
	@echo "Joomla pacakage can be found in ./build directory."

clean:
	@echo -e "\n\n# Cleaning up build directory"
	@echo "============================="
	$(test -d build && rm -rf build)

archive:
	test -d archive || mkdir archive
	tar --exclude \*.swp -jcf $(ARCHIVE_FNAME) $(COM_NAME)
	@echo -e "\n\nYou can find the tarball at $(ARCHIVE_FNAME)"

help:
	@echo "Available Targets: "
	@echo "package - Create Joomla component package."
	@echo "archive - Create backup of component src to archive folder"
	@echo "clean - clean build directory"

# Default target is package
.DEFAULT_GOAL := package
