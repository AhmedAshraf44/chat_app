
// // ignore_for_file: unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());


//     Future<void> loginUser({required String email,required String password}) async {
//       emit(LoginLoading());
//      try {  
//   UserCredential userCredential =
//      await FirebaseAuth.instance.signInWithEmailAndPassword(
//    email: email,
//    password: password,
//       );
//       emit(LoginSuccess());
// }on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//   emit(LoginFailure(errMeassage: 'No user found for that email.'));                                       
//   } else if (e.code == 'wrong-password') {
//   emit(LoginFailure(errMeassage: 'Wrong password provided for that user.'));                                        
//   }
//  }catch (e) {
//   emit(LoginFailure(errMeassage: 'This Error.. , try agin'));
// }
//   }



//    Future<void> rigesterUser({required String email,required String password}) async {
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
