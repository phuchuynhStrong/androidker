import 'package:androiker/core_packages.dart';
import 'package:androiker/di/component/auth_component.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'bloc/state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authRepo =
        context.read<AuthComponent>().authModule?.authenticationRepository;
    return BlocProvider(
      create: (_) => SignInBloc(
        routingBloc: context.read<RoutingBloc>(),
        authenticationRepository: authRepo,
      ),
      child: const SignInScreenContent(),
    );
  }
}

class SignInScreenContent extends StatefulWidget {
  const SignInScreenContent({Key? key}) : super(key: key);

  @override
  _SignInScreenContentState createState() => _SignInScreenContentState();
}

class _SignInScreenContentState extends State<SignInScreenContent> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<SignInBloc>();
    return AndroidkerScaffold(
      body: BlocBuilder<SignInBloc, SignInPageState>(
        builder: (context, state) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.all(Insets.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: theme.colorScheme.onBackground,
                          ),
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.onBackground
                                    .withOpacity(0.5),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: Insets.lg,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: theme.colorScheme.onBackground,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: theme.colorScheme.onBackground
                                    .withOpacity(0.5),
                              ),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Required field";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: Insets.lg,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              bloc.signIn(
                                email: _emailController.value.text,
                                password: _passwordController.value.text,
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => theme.colorScheme.onPrimary),
                          ),
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
