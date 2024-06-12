
// // ignore_for_file: unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// part 'register_state.dart';

// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterLoading());

//     Future<void> rigesterUser({required String email,required String password}) async {
//       emit(RegisterLoading());
//     try {
//   UserCredential userCredential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: email,
//     password: password,
//   );
//   emit(RegisterSuccess());
// }
// on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//   emit(RegisterFailure(errMessage:'The password provided is too weak. '));
//   } else if (e.code == 'email-already-in-use') {
//   emit(RegisterFailure(errMessage:'The account already exists for that email. '));
//   }
//   }                    
//  catch (e) {
//   emit(RegisterFailure(errMessage:'Something is Error '));

// }
//   }
// }
