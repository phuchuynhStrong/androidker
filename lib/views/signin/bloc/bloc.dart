import 'package:androiker/routing/app_link.dart';
import 'package:androiker/routing/app_pages.dart';
import 'package:androiker/routing/bloc/routing_bloc.dart';
import 'package:authentication/di/authentication_repository.dart';
import 'package:authentication/model/signin_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class SignInEvent {
  final String? email;
  final String? password;

  SignInEvent({@required this.email, @required this.password});
}

class SignInBloc extends Bloc<SignInEvent, SignInPageState> {
  final AuthenticationRepository? _authenticationRepository;
  final RoutingBloc? _routingBloc;
  SignInBloc({
    @required AuthenticationRepository? authenticationRepository,
    @required RoutingBloc? routingBloc,
  })  : assert(authenticationRepository != null),
        assert(routingBloc != null),
        _authenticationRepository = authenticationRepository,
        _routingBloc = routingBloc,
        super(SignInPageState.initial());

  void signIn({
    String? email,
    String? password,
  }) {
    add(SignInEvent(email: email, password: password));
  }

  @override
  Stream<SignInPageState> mapEventToState(SignInEvent event) async* {
    if (event.email != null && event.password != null) {
      yield state.copyWith.call(
        isExecuting: true,
        executed: false,
      );
      final nextState = await _authenticationRepository
          ?.signInWithEmailAndPassword(
            SignInRequest(
              email: event.email,
              password: event.password,
            ),
          )
          .then(
            (value) => state.copyWith.call(
              isExecuting: false,
              executed: true,
            ),
          )
          .catchError(
            (error) => state.copyWith.call(
              errorMsg: error.toString(),
            ),
          );
      if (nextState != null) {
        yield nextState;
      }

      if (nextState?.executed ?? false) {
        _routingBloc?.navigate(AppLink(
          pageId: AppPage.home.name,
        ));
      }
    }
  }
}
