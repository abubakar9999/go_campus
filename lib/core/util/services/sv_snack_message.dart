import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_campus/core/util/services/sv_navigaton.dart';

class SvSnackMessage {
  final context = navigatorKey.currentContext!;
  
  void showSnackMessage({required String content,}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
  }


}