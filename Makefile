# You need to run the following to let make work:
#    sudo xcodebuild -license accept

# install the following to /Applications before proceeding:
#     * CreateUserPkg
#     * AutoDMG.app
#     * the OSX installer (Install macOS Sierra.app)
#     * Xcode.app
# to /Applications before proceeding.

OSX := /Applications/Install macOS Sierra.app
AUTODMG := /Applications/AutoDMG.app/Contents/MacOS/AutoDMG
OUTPUT := $(shell date +%Y%m%d).osx.10.12.adminadmin.dmg

default: $(OUTPUT)

prepare:
	sudo pmset -a sleep 180
	sudo pmset -a displaysleep 180
	$(AUTODMG) update

$(OUTPUT): prepare custompkg/custom.pkg
	-$(AUTODMG) \
		--log-level 7 \
		--logfile - \
		build \
		-n "root" \
		-u -U \ -o /tmp/output.dmg \
		"$(OSX)" \
		/Applications/Xcode.app \
		/Applications/AutoDMG.app \
		/Applications/CreateUserPkg.app \
		"$(OSX)" \
		$(PWD)/pkgs/*.pkg \
		cp /tmp/output.dmg $(PWD)/$@

clean:
	rm custompkg/custom.pkg
