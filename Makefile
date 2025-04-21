.PHONY: default connect apps smarttube

default: connect apps

connect:
	adb connect "${IP}"
	adb devices

apps: smarttube

smarttube:
	aria2c https://github.com/yuliskov/SmartTube/releases/download/27.37s/SmartTube_stable_27.37_armeabi-v7a.apk
	adb install SmartTube_stable_27.37_armeabi-v7a.apk
