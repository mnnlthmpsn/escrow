import 'package:escrow/features/auth/signup/signup_bloc.dart';
import 'package:escrow/features/auth/signup/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget get SignUpOutlet {
  return BlocProvider<SignUpBloc>(
      create: (BuildContext context) => SignUpBloc(),
      child: const SignUpScreen()
  );
}