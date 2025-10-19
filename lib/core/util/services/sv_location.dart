import 'dart:async';
import 'package:geolocator/geolocator.dart';

class SvLocation {
  SvLocation._();
  static SvLocation instance = SvLocation._();
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
    timeLimit: Duration(
      seconds: 3,
    ), // throw a TimeoutException if the process dose not complete within the define duration. like "TimeoutException (TimeoutException after 0:00:01.000000: Future not completed)"
  );

  final LocationSettings androidLocationSetting = AndroidSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
    forceLocationManager: true,
    intervalDuration: const Duration(seconds: 10),
    // (Optional) Set foreground notification config to keep the app alive
    // when going to the background
    foregroundNotificationConfig: const ForegroundNotificationConfig(
      notificationText:
          "Example app will continue to receive your location even when you aren't using it",
      notificationTitle: "Running in Background",
      enableWakeLock: true,
    ),
  );

  /// Determine the current position of the device.
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // await Geolocator.openAppSettings();
    // await Geolocator.openLocationSettings();

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services. mean enable loation service from status ber.
      await Geolocator.openAppSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(
          'Location permissions are denied #LocationPermission.denied',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions. #LocationPermission.deniedForever.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );
  }

  Future<bool> checkServiceStartValidation({bool islastCheck = false}) async {
    try {
      bool isValid = true;
      bool serviceEnabled;
      LocationPermission permission;

      // await Geolocator.openAppSettings();
      // await Geolocator.openLocationSettings();

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services. mean enable loation service from status ber.
        isValid = false;
        await Geolocator.openLocationSettings();
      }

      permission = await Geolocator.checkPermission();
      if (permission != LocationPermission.always) {
        // always because we are going to run in background.
        permission = await Geolocator.requestPermission();
        print("checking openLocationSettings $permission");
        if (permission != LocationPermission.always) {
          isValid = false;
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        isValid = false;
        await Geolocator.openAppSettings();
      }
      if (islastCheck) return isValid;
    } catch (e) {
      return false;
    }
    return await checkServiceStartValidation(islastCheck: true);
  }

  Future<Position?> lastKnownLocation() async {
    Position? position = await Geolocator.getLastKnownPosition();
    return position;
  }

  void listenLocation() {
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(
          locationSettings: LocationSettings(
            // if we set time limit, and within the time if we did not get any update it will throw an exceptions.
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
          ),
        ).listen((Position? position) {
          print(
            position == null
                ? 'Unknown'
                : '${position.latitude.toString()}, ${position.longitude.toString()}',
          );
        });
  }
}
