import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// TimeOfDay to String time
String formatTimeOfDay({TimeOfDay? time, DateTime? dateTime}) {
  if (dateTime != null) {
    final timeFormat = DateFormat('hh:mm a'); 
    String time = '${timeFormat.format(dateTime)}';
    return time;
  }

  final hour = time!.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? 'AM' : 'PM';
  return '$hour:$minute $period';
}

bool checkIsEmpty(String? value) {
  return (value == null || value.trim().isEmpty) ? true : false;
}

// email validator
String? emailValidator(String email) {
  email = email.trim();
  if (email.isEmpty) return "Email Required";
  final pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return pattern.hasMatch(email) ? null : "Invalid Email";
}

// phone number validator
// ^(?:\+88|88)? → allows optional country code +88 or 88.
// 01[2-9] → valid operator codes (e.g., 013 to 019).
// \d{8}$ → exactly 8 digits after the operator code (total 11 digits).
String? validatePhone(String? value) {
  if (checkIsEmpty(value)) return "Enter Phone Number";
  value = value!.trim();
  if (value.contains(" ")) {
    return "Number Can't Contain \"Space\"";
  }
  if (value.isEmpty) return "Enter Phone";
  final pattern = RegExp(r'^(?:\+88|88)?01[2-9]\d{8}$');
  return pattern.hasMatch(value) ? null : "Invalid Phone";
}

String? validateName(String? value) {
  if (checkIsEmpty(value)) {
    return 'Enter Name';
  }
  value = value!.trim();
  if (value.length < 4) {
    return "Name should contain  at least 4 character!";
  }
  final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
  if (!nameRegExp.hasMatch(value.trim())) {
    return 'Name must contain only letters and spaces';
  }
  return null; // valid
}

String? validateTitle(String? value) {
  if (checkIsEmpty(value)) {
    return 'Title are required';
  }
  value = value!.trim();
  return null; // valid
}

String? validateDesc(String? value) {
  if (checkIsEmpty(value)) {
    return 'Description are required';
  }
  value = value!.trim();
  if (value.length < 14) {
    return "Description shouldcontain  at least 14 character!";
  }

  return null; // valid
}

String? validatePass(String? value) {
  if (checkIsEmpty(value)) {
    return 'Password are required';
  }
  if (value!.contains(" ")) {
    return "pass can't contain \"Space\"";
  }
  if (value.length < 6) {
    return "Password should contain  at least 6 character!";
  }

  return null; // valid
}

String? validateAddress(String? value) {
  if (checkIsEmpty(value)) {
    return 'Enter Address';
  }
  if (value!.length < 10) {
    return "Address should contain at least 10 character!";
  }

  return null; // valid
}

String? validateID(String? value) {
  if (checkIsEmpty(value)) return "Enter ID";
  value = value!.trim();
  final regex = RegExp(r'[^0-9]');
  if (value.length < 5) {
    return "invalid uid";
  }
  return !regex.hasMatch(value) ? null : "invalid uid";
}

String? validatePrice(String? value) {
  if (checkIsEmpty(value)) {
    return "Enter price";
  }
  double pr = 0;
  if (value!.contains(" ")) return "Remove White Space";
  try {
    pr = double.parse(value.toString().trim());
  } catch (e) {
    return "Invalid Price";
  }
  if (pr < 0) {
    return "Argument Can't be Negetive";
  }
  return null;
}
