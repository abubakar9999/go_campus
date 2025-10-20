import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_campus/core/util/constants/keys.dart';
import 'package:go_campus/core/util/controller/c_authectication.dart';
import 'package:go_campus/core/util/controller/c_theme.dart';
import 'package:go_campus/core/util/services/sv_background.dart';
import 'package:go_campus/core/util/services/sv_navigaton.dart';
import 'package:go_campus/src/presentation/authentication/log_in/s_signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_campus/src/presentation/home/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SvBackground.instance.initializeService();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CAuthentication()),
        BlocProvider(create: (_) => CTheme()),
        // BlocProvider(create: (_) => CAuthentication()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932), // iPhone X size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return BlocBuilder<CTheme, int>(
          builder:
              (BuildContext context, int state) => MaterialApp(
                title: 'go_campus',
                navigatorKey: navigatorKey,
                theme: context.read<CTheme>().currentTheme,
                home: HomePage(role: Keys.student,),
                // home: SSignIn(),
              ),
        );
      },
    );
  }
}
