

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_copy/UI/screens/sign_up_screen.dart';
import 'package:vk_copy/localization/localizations.dart';
import 'package:vk_copy/login/login_cubit.dart';
import 'package:vk_copy/repositories/auth_repository.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(MyLocalizations.login),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(create: (_) => LoginCubit(context.read<AuthRepository>()
        ),
          child: const LoginForm() ,
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
        listener: (context,state){
          if(state.status == LoginStatus.error){
          }
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _EmailInput(),
        const SizedBox(height: 8,),
        _PasswordInput(),
        const SizedBox(height: 8,),
        _LoginButton(),
        const SizedBox(height: 8,),
        _SignUpButton()
    ],
    ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous,current) => previous.email != current.email,
        builder: (context,state){
          return TextField(onChanged: (email) {context.read<LoginCubit>().emailChanged(email);
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
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous,current) => previous.password != current.password,
        builder: (context,state){
          return TextField(
            obscureText: true,
            onChanged: (password) {context.read<LoginCubit>().passwordChanged(password);
          },
            decoration:  InputDecoration(labelText: MyLocalizations.password),
          );
        });
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous,current) => previous.status != current.status,
        builder: (context,state){
          return state.status == LoginStatus.submitting
              ? const CircularProgressIndicator()
              : ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(200,40)),
              onPressed: (){
                (context).read<LoginCubit>().logInWithCredentials();
              },
              child:  Text(MyLocalizations.login));
        });
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  fixedSize: const Size(200,40)),
              onPressed: () => Navigator.of(context).push<void>(SignUpScreen.route()),
              child: Text(MyLocalizations.signUp,style: TextStyle(color: Colors.blue),));
        }
  }
