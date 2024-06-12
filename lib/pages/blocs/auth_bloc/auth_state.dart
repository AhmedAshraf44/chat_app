part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {}
// ignore: must_be_immutable
final class LoginFailure extends AuthState {

String errMeassage;
LoginFailure({required this.errMeassage});
}

final class RegisterLoading extends AuthState {}
final class RegisterSuccess extends AuthState {}
// ignore: must_be_immutable
final class RegisterFailure extends AuthState 
{
String errMessage ;

RegisterFailure({required this.errMessage});
}









// using to bloc :
// 1- create event بحدد
// 2- create state بحدد
// 3- create bloc

// 4- provide bloc
// 5- integrte bloc
// 6- triggret bloc