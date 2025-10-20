import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_campus/core/util/constants/all_enums.dart';
import 'package:go_campus/core/util/constants/keys.dart';
import 'package:go_campus/core/util/data/models/m_user.dart';
import 'package:go_campus/core/util/services/sv_background.dart';
import 'package:go_campus/core/util/services/sv_navigaton.dart';
import 'package:go_campus/core/util/services/sv_snack_message.dart';
import 'package:go_campus/src/presentation/home/home.dart';
import 'package:go_campus/src/presentation/authentication/log_in/s_signin.dart';


// evens
abstract class AuthenticationEvent {}

class SignInEvent extends AuthenticationEvent {
  final String role;
  final String phone;
  final String pass;
  SignInEvent( {required this.phone, required this.pass, required this.role });
}

class SignUpEvent extends AuthenticationEvent {
  final MUser mUser;
  SignUpEvent(this.mUser);
}

// stats
abstract class AuthenticationState {}

class InitialState extends AuthenticationState {}

class LoadingState extends AuthenticationState {}

class LoadedState extends AuthenticationState {
  final MUser mUser;
  LoadedState({required this.mUser});
}

class ErrorState extends AuthenticationState {
  final String message;
  ErrorState({required this.message});
}

class CAuthentication extends Bloc<AuthenticationEvent, AuthenticationState> {
  CAuthentication() : super(InitialState()) {

    on<SignInEvent>((event, emit) async {
      emit(LoadingState());
      try {
        MUser mUser = await SvAuthentication().signIn(event.phone, event.pass);
        emit(LoadedState(mUser: mUser));
        // start background location service 
        SvBackground.instance.startBackgroundService();
        SvNavigaton().navigateTo(screen: HomePage(role: mUser.role,));
      } catch (e) {
        emit(ErrorState(message: e.toString()));
        SvSnackMessage().showSnackMessage(
          content: "Error : ${(state as ErrorState).message}",
        );
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(LoadingState());
      try {
        await SvAuthentication().signUp(event.mUser);
        SvSnackMessage().showSnackMessage(content: "Signup Success");
        // we are want to verify again.
        emit(InitialState());
        SvNavigaton().navigateTo(screen: SSignIn());
      } catch (e) {
        print("error");
        emit(ErrorState(message: e.toString()));
        SvSnackMessage().showSnackMessage(
          content: "${(state as ErrorState).message}",
        );
      }
    });
  }
}

abstract class IAuthentication {
  Future<MUser> signIn(String email, String pass);
  Future<void> signUp(MUser mUser);
}

class SvAuthentication implements IAuthentication {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<MUser> signIn(String phone, String password) async {
    try {
      DocumentSnapshot documentSnapshot = await firebaseFirestore
          .collection(Keys.users)
          .doc(phone)
          .get();
      if (documentSnapshot.exists && documentSnapshot.data() != null) {
        MUser mUser = MUser.fromMap(
          documentSnapshot.data() as Map<String, dynamic>,
        );
        if (mUser.pass == password) {
          return mUser;
        } else {
          throw "Wrong Pass";
        }
      }
      throw "User Not Found";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUp(MUser mUser) async {
    try {
      print("1");
      print("1");
      await firebaseFirestore
          .collection(Keys.users)
          .doc(mUser.phone)
          .set(mUser.toMap(forLocal: false));
      print("2");
    } catch (e) {
      print("object");
      rethrow;
    }
  }
}
