.PHONY: default connect apps debloat fdroid aurora smarttube jellyfin stremio

default: connect apps

connect:
	adb connect "${IP}"
	adb devices

apps: fdroid aurora smarttube jellyfin

debloat:
	adb shell pm disable-user --user 0 com.tcl.exhibit
	adb shell pm disable-user --user 0 com.tcl.ocean.instructions
	adb shell pm disable-user --user 0 com.tcl.repairguide
	adb shell pm disable-user --user 0 com.tcl.hearaid
	adb shell pm disable-user --user 0 com.tcl.channelplus
	adb shell pm disable-user --user 0 com.tcl.magiconnectfree
	adb shell pm disable-user --user 0 com.tcl.gamebar
	adb shell pm disable-user --user 0 com.tcl.esticker
	adb shell pm disable-user --user 0 com.tcl.t_solo
	adb shell pm disable-user --user 0 com.tcl.ui_mediaCenter
	adb shell pm disable-user --user 0 com.tcl.tv.tclhome_passive
	adb shell pm disable-user --user 0 com.tcl.dashboard
	adb shell pm disable-user --user 0 com.tcl.guard

F-Droid.apk:
	aria2c https://f-droid.org/F-Droid.apk

fdroid: F-Droid.apk
	adb install F-Droid.apk

com.aurora.store_76.apk:
	aria2c https://f-droid.org/repo/com.aurora.store_76.apk

aurora: com.aurora.store_76.apk
	adb install com.aurora.store_76.apk

SmartTube_stable_30.56_armeabi-v7a.apk:
	aria2c https://github.com/yuliskov/SmartTube/releases/download/30.56s/SmartTube_stable_30.56_armeabi-v7a.apk

smarttube: SmartTube_stable_30.56_armeabi-v7a.apk
	adb install SmartTube_stable_30.56_armeabi-v7a.apk

org.jellyfin.mobile_2060299.apk:
	aria2c https://f-droid.org/repo/org.jellyfin.mobile_2060299.apk

jellyfin: org.jellyfin.mobile_2060299.apk
	adb install org.jellyfin.mobile_2060299.apk

com.stremio.one-1.6.12-11049190-armeabi-v7a.apk:
	aria2c https://dl.strem.io/android/v1.6.12-com.stremio.one/com.stremio.one-1.6.12-11049190-armeabi-v7a.apk

stremio: com.stremio.one-1.6.12-11049190-armeabi-v7a.apk
	adb install com.stremio.one-1.6.12-11049190-armeabi-v7a.apk
