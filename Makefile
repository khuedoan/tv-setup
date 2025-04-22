.PHONY: default connect apps fdroid smarttube jellyfin stremio

default: connect apps

connect:
	adb connect "${IP}"
	adb devices

apps: fdroid smarttube jellyfin

F-Droid.apk:
	aria2c https://f-droid.org/F-Droid.apk

fdroid: F-Droid.apk
	adb install F-Droid.apk

SmartTube_stable_27.37_armeabi-v7a.apk:
	aria2c https://github.com/yuliskov/SmartTube/releases/download/27.37s/SmartTube_stable_27.37_armeabi-v7a.apk

smarttube: SmartTube_stable_27.37_armeabi-v7a.apk
	adb install SmartTube_stable_27.37_armeabi-v7a.apk

org.jellyfin.mobile_2060299.apk:
	aria2c https://f-droid.org/repo/org.jellyfin.mobile_2060299.apk

jellyfin: org.jellyfin.mobile_2060299.apk
	adb install org.jellyfin.mobile_2060299.apk

com.stremio.one-1.6.12-11049190-armeabi-v7a.apk:
	aria2c https://dl.strem.io/android/v1.6.12-com.stremio.one/com.stremio.one-1.6.12-11049190-armeabi-v7a.apk

stremio: com.stremio.one-1.6.12-11049190-armeabi-v7a.apk
	adb install com.stremio.one-1.6.12-11049190-armeabi-v7a.apk
