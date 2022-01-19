import 'package:appdevassignment/feature/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/route/route.dart';
import 'feature/auth/presentation/screens/LoginScreen.dart';
import 'feature/recommend/presentation/blocs/tournaments/tournament_bloc.dart';
import 'feature/recommend/presentation/screens/home_screen.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'package:appdevassignment/core/screens/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(LoadUserEvent()),
        ),
        BlocProvider<TournamentBloc>(
          create: (context) => sl<TournamentBloc>()..add(FetchTournamentsEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState authState) {
          if (authState is AuthLoadingState || authState is AuthInitial) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const LoadingScreen(),
            );
          } else if (authState is AuthLoadSuccessState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'App Assignment',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const HomeScreen(),
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          }
          if(authState is AuthenticateFailState){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'App Assignment',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home:  LoginScreen(message: authState.text,),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'App Assignment',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoginScreen(message: '',),
          );
        });
  }
}
