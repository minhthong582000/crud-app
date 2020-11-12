import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form/bloc/auth_bloc.dart';
import 'package:login_form/common/common.dart';
import 'package:login_form/form/home/home_page.dart';
import 'package:login_form/form/login/login_page.dart';
import 'package:login_form/repository/user.repository.dart';
import 'package:login_form/splash/splash_page.dart';

// class SimpleBlocDelegate extends BlocDele {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }

//   @override
//   void onError(Bloc bloc, Object error, StackTrace stacktrace) {
//     super.onError(bloc, error, stacktrace);
//   }
// }

void main() {
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthBloc>(
    create: (context) {
      return AuthBloc(userRepository: userRepository)..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthUnintialized) {
            return SplashPage();
          }
          if (state is AuthAuthenticated) {
            return HomePage();
          }
          if (state is AuthUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthLoading) {
            return LoadingIndicator();
          }
        },
      ),
    );
  }
}
