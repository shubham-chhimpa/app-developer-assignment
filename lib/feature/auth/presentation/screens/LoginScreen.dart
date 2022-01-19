import 'package:appdevassignment/feature/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';

  final String message;

  const LoginScreen({Key? key, required this.message}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordValid = false;
  bool isUsernameValid = false;
  bool enableSubmitBtn = false;
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  bool validatePassword(String val) {
    int len = val.length;
    if (len < 3 || len > 11) return false;
    return true;
  }

  _validateInput(value) {
    return value != null && (value.length < 3 || value.length > 11);
  }

  String _getMessage(AuthState authState) {
    if (authState is AuthenticateFailState) {
      String message = authState.text;
      return message;
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final authState = BlocProvider.of<AuthBloc>(context).state;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/game_tv_logo.png", width: 200),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: mobileController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile',
                        ),
                        validator: (value) {
                          if (value != null && _validateInput(value)) {
                            setState(() {
                              isUsernameValid = false;
                              enableSubmitBtn =
                                  isUsernameValid && isPasswordValid;
                            });
                            return 'Length should be greater than 3 and smaller than 11';
                          }
                          setState(() {
                            isUsernameValid = true;
                            enableSubmitBtn =
                                isUsernameValid && isPasswordValid;
                          });
                          return null;
                        },
                        onChanged: (String val) {
                          _formKey.currentState?.validate();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value != null && _validateInput(value)) {
                            setState(() {
                              isPasswordValid = false;
                              enableSubmitBtn =
                                  isUsernameValid && isPasswordValid;
                            });
                            return 'Length should be greater than 3 and smaller than 11';
                          }

                          setState(() {
                            isPasswordValid = true;
                            enableSubmitBtn =
                                isUsernameValid && isPasswordValid;
                          });
                          return null;
                        },
                        onChanged: (String val) {
                          _formKey.currentState?.validate();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: enableSubmitBtn
                  ? () {
                BlocProvider.of<AuthBloc>(context).add(
                  AuthenticateUserEvent(
                    mobileNumber: mobileController.text,
                    password: passwordController.text,
                  ),
                );
              }
                  : null,
              child: const Text('Submit'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _getMessage(authState),
                style: const TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
