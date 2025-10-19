import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_campus/core/util/services/sv_location.dart';
import 'package:go_campus/firebase_options.dart';

class SvBackground {
  SvBackground._();
  static SvBackground instance = SvBackground._();
  final service = FlutterBackgroundService();

  void startBackgroundService() {
    debugPrint("background service start called");
    service.startService();
    // service.isrunning()// check the service currently running or not.
  }

  void stopBackgroundService() {
    debugPrint("background service stop called");
    service.invoke("stop");
  }

  // called in "main()" method 
  // don't forget to add "WidgetsFlutterBinding.ensureInitialized();"
  Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      iosConfiguration: IosConfiguration(
        autoStart: false,
        onForeground: onStart,
        onBackground: onIosBackground,
      ),

      androidConfiguration: AndroidConfiguration(
        autoStart: false,
        onStart: onStart,
        // work in (terinated, foreground, background) mode if "isForegroundMode: true",
        // if "isForegroundMode: true",
        //     work fine in forefeground,
        //     background mode somtime work/sometime dose not work
        //     terminated mode dose not work
        isForegroundMode: true,
        autoStartOnBoot: false,
      ),
    );
  }
}

// we have to keep it outside of a class
// because it's top level function
@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

// we have to keep it outside of a class
// because it's top level function
@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Initialize Firebase in the background service
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  Timer.periodic(const Duration(minutes: 5), (timer) async {
    debugPrint("service is successfully running ${DateTime.now().second}");

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    SvLocation svLocation = SvLocation.instance;
    DateTime currentDateTime = DateTime.now();
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: svLocation.androidLocationSetting
      );
      debugPrint("device location found");
      await firebaseFirestore
          .collection("Locations")
          .doc(currentDateTime.toString())
          .set({"currentDate": currentDateTime, "location": position.toJson()});

      debugPrint("success");
    } catch (e) {
      // currently noting to do.
      await firebaseFirestore
          .collection("Locations")
          .doc(currentDateTime.toString() + "e")
          .set({
            "currentDate": currentDateTime,
            "location": "position.toJson()",
          });
      debugPrint("Error" + e.toString());
    }
  });
  service.on("stop").listen((event) {
    // timer?.cancel(); // Cancel the timer when stopping
    service.stopSelf();
    debugPrint("background process is now stopped");
  });
}
