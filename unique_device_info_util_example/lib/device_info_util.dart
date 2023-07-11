import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtil {
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // 싱글톤 패턴

  // 유틸리티
  Future<BaseDeviceInfo> getDeviceInfo() async {
    return await deviceInfo.deviceInfo;
  }

  Future<BaseDeviceInfo> getDeviceSerial() async {
    if (Platform.isAndroid) {
      final androidData = await getAndroidInfo();
      androidData.androidId;
    }
  }

  Future<dynamic> getDetailDeviceInfo() async {
    if (Platform.isAndroid) {
      return await getAndroidInfo();
    }
    if (Platform.isIOS) {
      return await getIosInfo();
    }
    if (Platform.isLinux) {
      return await getLinuxInfo();
    }
    if (Platform.isMacOS) {
      return await getMacOsInfo();
    }
    if (Platform.isWindows) {
      return await getWindowInfo();
    }
  }

  Future<AndroidDeviceInfo> getAndroidInfo() async => await deviceInfo.androidInfo;
  Future<IosDeviceInfo> getIosInfo() async => await deviceInfo.iosInfo;
  Future<LinuxDeviceInfo> getLinuxInfo() async => await deviceInfo.linuxInfo;
  Future<MacOsDeviceInfo> getMacOsInfo() async => await deviceInfo.macOsInfo;
  Future<WindowsDeviceInfo> getWindowInfo() async => await deviceInfo.windowsInfo;
}
