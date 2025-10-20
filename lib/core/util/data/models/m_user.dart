import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_campus/core/util/constants/all_enums.dart';
import 'package:go_campus/core/util/constants/keys.dart';

class MUser {
  String uId;
  String role;
  String? studentId;
  String fname;
  String email;
  String image;
  String phone;
  String pass;

  String fullAddress;
  String? deviceId;
  Timestamp? createdAt;

  MUser({
    required this.uId,
    required this.role,
    required this.fname,
    required this.email,
    required this.image,
    required this.phone,
    required this.pass,
    required this.fullAddress,
    this.deviceId,
    this.createdAt,
  });

  Map<String, dynamic>toMap({bool forLocal = true}){
    return{
      Keys.uId : uId,
      Keys.role  : role,
      Keys.fname  : fname,
      Keys.email  : email,
      Keys.image  : image,
      Keys.phone  : phone,
      Keys.pass   : pass,
      Keys.fullAddress  : fullAddress,
      Keys.deviceId: deviceId,
      Keys.createdAt: forLocal? createdAt : FieldValue.serverTimestamp(),
    };
  }

  factory MUser.fromMap(Map<String, dynamic>data){
    return MUser(
      uId: data[Keys.uId]??"", 
      role: data[Keys.role]??"", 
      fname: data[Keys.fname]??"", 
      email: data[Keys.email]??"", 
      image: data[Keys.image]??"", 
      phone: data[Keys.phone]??"",
      pass:  data[Keys.pass],
      fullAddress: data[Keys.fullAddress]??"",
      deviceId: data[Keys.deviceId],
      createdAt: data[Keys.createdAt], //Timestamp.fromDate(DateTime.now())==Timestamp.now(),
    );
  }
}
