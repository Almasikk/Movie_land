

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_copy/localization/localizations.dart';
import 'package:vk_copy/repositories/auth_repository.dart';
import 'package:vk_copy/sign_up/signup_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Route route(){
    return MaterialPageRoute<void>(builder: (_) => const SignUpScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyLocalizations.signUp),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(context.read<AuthRepository>()),
          child:const SignUpForm(),),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit,SignUpState>(
        listener: (context,state){
          if(state.status == SignUpStatus.error){}
        },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _EmailInput(),
          const SizedBox(height: 8,),
          _PasswordInput(),
          const SizedBox(height: 8,),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous,current) => previous.email != current.email,
        builder: (context,state){
          return TextField(onChanged: (email) {context.read<SignUpCubit>().emailChanged(email);
          },
            decoration:  InputDecoration(labelText: MyLocalizations.email),
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous,current) => previous.password != current.password,
        builder: (context,state){
          return TextField(
            obscureText: true,
            onChanged: (password) {context.read<SignUpCubit>().passwordChanged(password);
          },
            decoration: InputDecoration(labelText: MyLocalizations.password),
          );
        });
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous,current) => previous.status != current.status,
        builder: (context,state){
          return state.status == SignUpStatus.submitting ?
              const CircularProgressIndicator() :
              ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(200,40)),
                  onPressed: (){
                    context.read<SignUpCubit>().signupFormSubmitted();
                  },
                  child: Text(MyLocalizations.signUp));
        });
  }
}


