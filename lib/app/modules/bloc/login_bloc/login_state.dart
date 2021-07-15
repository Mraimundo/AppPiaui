import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

// import 'package:piaui_app/app/modules/bloc/login_bloc/login_bloc.dart';
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
