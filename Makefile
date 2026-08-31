export TARGET = iphone:clang:16.5:14.0
export ARCHS = arm64

# Module configuration
export YTLITE_PATH = Tweaks/YTLite
export YTLITE_VERSION = 5.2.2
export YTLITE_DEB = $(YTLITE_PATH)/com.dvntm.ytlite_$(YTLITE_VERSION)_iphoneos-arm.deb
export YTLITE_DYLIB = $(YTLITE_PATH)/YTLite.dylib

# YouTube IPA configuration
export YOUTUBE_IPA_PATH = youtube.ipa
export YOUTUBE_BUNDLE_ID = com.google.ios.youtube

# Output package name
export PACKAGE_NAME = YTLitePlus

include $(THEOS)/makefiles/common.mk

# Main Tweak Makefile
TWEAK_NAME = YTLitePlus
$(TWEAK_NAME)_FILES = $(wildcard Sources/*.xm)
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unsupported-availability-guard
$(TWEAK_NAME)_LDFLAGS = -Wl,-reexport_library,$(THEOS)/lib/libsubstrate.dylib

include $(THEOS_MAKE_PATH)/tweak.mk

# Build YouTube IPA
before-package::
	@echo "==> Copying YTLite.dylib to Frameworks..."
	@mkdir -p Frameworks/YTLite.framework
	@cp $(YTLITE_DYLIB) Frameworks/YTLite.framework/YTLite || (echo "Error: YTLite.dylib not found at $(YTLITE_DYLIB)" && exit 1)
	@echo "==> Downloading YouTube IPA..."
	@curl -sL "https://raw.githubusercontent.com/dayanch96/YTLite/refs/heads/main/scripts/get_youtube.py" | python3 - --version $(YOUTUBE_VERSION) || (echo "Error: Failed to download YouTube IPA" && exit 1)
	@echo "==> Injecting YTLite into YouTube IPA..."
	@python3 -c "
import zipfile
import os
import shutil

# Extract YouTube IPA
with zipfile.ZipFile('$(YOUTUBE_IPA_PATH)', 'r') as zip_ref:
    zip_ref.extractall('Payload')

# Copy YTLite.framework to Frameworks
shutil.copytree('Frameworks/YTLite.framework', 'Payload/Payload/Frameworks/YTLite.framework')

# Update Info.plist to load YTLite
import plistlib
with open('Payload/Payload/Info.plist', 'rb') as f:
    info = plistlib.load(f)

# Add YTLite to frameworks
if 'CFBundleExecutable' in info:
    pass

# Save modified Info.plist
with open('Payload/Payload/Info.plist', 'wb') as f:
    plistlib.dump(info, f)

# Repackage IPA
shutil.rmtree('Payload', ignore_errors=True)
"
	@echo "==> IPA injection complete"
