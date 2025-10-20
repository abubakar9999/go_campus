import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_campus/core/util/constants/my_color.dart';
import 'package:go_campus/core/util/constants/my_dimention.dart';

class CTheme extends Cubit<int> {
  CTheme() : super(0);

  ThemeData get currentTheme => state == 0 ? lightTheme : darkTheme;
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
  Color backgroundColor = MyColor.backgroundColor;
  Color backGroundColorDark = Colors.black;

  void updateTheme(int index) async {
    emit(index);
    debugPrint("theme updated $index");
    // SharedPrefService.instance.setInt(PKeys.themeIndex, index);
  }

  ThemeData get _lightTheme => ThemeData(
    cardColor: Colors.blue,

    // ▶️ bottom navigation ber Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColor.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),

    // ▶️ Core Configuration
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: backgroundColor,
    splashColor: const Color(0xFF6F23FD).withValues(alpha: 0.1),
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.black.withValues(alpha: 0.05),
    dividerColor: Colors.grey[300],

    // ▶️ AppBar Theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
      ),
    ),

    // ▶️ Drawer Theme
    drawerTheme: const DrawerThemeData(scrimColor: Colors.white),

    // ▶️ Text Theme
    textTheme: TextTheme(
      // 🔹 Display
      displayLarge: TextStyle(
        fontSize: 57.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),

      // 🔹 Headline
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),

      // 🔹 Title
      titleLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),

      // 🔹 Body
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xFF292929),
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ), // default
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.grey[600],
      ),

      // 🔹 Label
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),

    // ▶️ Input Field Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      alignLabelWithHint: true, // lable will be show initially like hit text.
      fillColor: MyColor.textFieldFillColor,
      labelStyle: TextStyle(color: Colors.black),
      hintStyle: TextStyle(
        color: const Color(0xFFA0A0A0),
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(MyDimension.boarderRadius),
        ),
        borderSide: const BorderSide(
          color: MyColor.textFieldEnabledBorder,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(MyDimension.boarderRadius),
        ),
        borderSide: const BorderSide(
          color: MyColor.textFieldEnabledBorder,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(MyDimension.boarderRadius),
        ),
        borderSide: const BorderSide(
          color: MyColor.textFieldEnabledBorder,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(MyDimension.boarderRadius),
        ),
        borderSide: const BorderSide(
          color: MyColor.textFieldEnabledBorder,
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(MyDimension.boarderRadius),
        ),
        borderSide: const BorderSide(
          color: MyColor.textFieldEnabledBorder,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(MyDimension.boarderRadius),
        ),
        borderSide: const BorderSide(
          color: MyColor.textFieldEnabledBorder,
          width: 1,
        ),
      ),
    ),

    // ▶️ Button Theme
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF002E5B),
        secondary: const Color(0xFF3AADE1),
        tertiary: Colors.white,
        shadow: Colors.grey.withValues(alpha: 0.1),
      ),
      highlightColor: Colors.white,
    ),

    // ▶️ Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        // padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        //   EdgeInsets.symmetric(horizontal: 12.w),
        // ),
        side: const WidgetStatePropertyAll<BorderSide>(BorderSide(width: 1.0)),
        backgroundColor: const WidgetStatePropertyAll<Color?>(
          Colors.transparent,
        ),
      ),
    ),
  );

  ThemeData get _darkTheme => ThemeData(
    // colorScheme: ColorScheme.dark(
    //     surface: MyColor.white, // 👈 custom popup color
    // ),
    // dropdownMenuTheme: DropdownMenuThemeData(
    //   menuStyle: MenuStyle(
    //     elevation: WidgetStatePropertyAll(0),
    //     backgroundColor: WidgetStateProperty.all(Colors.red),
    //   ),
    // ),

    // ▶️ Core Configuration
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backGroundColorDark,
    splashColor: const Color(0xFF6F23FD).withValues(alpha: 0.1),
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    primaryColor: Colors.black,
    dividerColor: Colors.grey[300],
    cardColor: Colors.black,

    // ▶️ Drawer Theme
    drawerTheme: const DrawerThemeData(scrimColor: Colors.white),

    // ▶️ Text Theme
    textTheme: TextTheme(
      // bodyLarge: TextStyle(
      //   color: Colors.white,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodyMedium: TextStyle(
      //   color: Colors.black,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodySmall: TextStyle(
      //   color: const Color(0xff34C759),
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // displayLarge: TextStyle(
      //   color: Colors.white70,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
    ),

    // ▶️ Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      // errorStyle: TextStyle(
      //   color: Colors.red,
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // contentPadding: EdgeInsets.symmetric(horizontal: PDimension.paddingX),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(PDimension.boxRadius),
      //   borderSide: BorderSide.none,
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(PDimension.boxRadius),
      //   borderSide: BorderSide.none,
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(PDimension.boxRadius),
      //   borderSide: BorderSide.none,
      // ),
    ),

    // ▶️ Button Theme
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF002E5B),
        secondary: const Color(0xFF3AADE1),
        tertiary: Colors.white,
        shadow: Colors.grey.withValues(alpha: 0.1),
      ),
      highlightColor: Colors.white,
    ),

    // ▶️ Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color?>(
          const Color(0xFF6F23FD).withValues(alpha: 0.2),
        ),
      ),
    ),
  );
}
