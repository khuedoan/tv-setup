.PHONY: default connect apps smarttube jellyfin

default: connect apps

connect:
	adb connect "${IP}"
	adb devices

apps: smarttube jellyfin

smarttube:
	aria2c https://github.com/yuliskov/SmartTube/releases/download/27.37s/SmartTube_stable_27.37_armeabi-v7a.apk
	adb install SmartTube_stable_27.37_armeabi-v7a.apk

jellyfin:
	aria2c https://f-droid.org/repo/org.jellyfin.mobile_2060299.apk
	adb install org.jellyfin.mobile_2060299.apk
