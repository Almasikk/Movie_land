import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_copy/app/app_bloc.dart';
import 'package:vk_copy/repositories/auth_repository.dart';

import 'config/routes.dart';


Future<void>  main() async {
  return BlocOverrides.runZoned(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp(
          );
          final authRepository = AuthRepository();
          runApp( App(authRepository: authRepository));
});
}

class App extends StatelessWidget {
  final AuthRepository _authRepository;
  const App({Key? key,required AuthRepository authRepository}) : _authRepository = authRepository, super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: _authRepository,
      child:
      BlocProvider(
          create: (_) => AppBloc(authRepository: _authRepository),
          child: const AppView(),
      ),
    );

  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVLand",
      debugShowCheckedModeBanner: false,
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}



