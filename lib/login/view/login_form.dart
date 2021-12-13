import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:live_player/login/bloc/login_bloc.dart';
import 'package:live_player/login/bloc/login_state.dart';
import 'package:live_player/login/bloc/login_event.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child:  Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView(
            children:[ Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Welcome!', style: TextStyle(color: Colors.blue[900], fontSize: 48, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 70,),
                  _UsernameInput(),
                  //const Padding(padding: EdgeInsets.all(12)),
                  const SizedBox(height: 70,),
                  _PasswordInput(),
                  //const Padding(padding: EdgeInsets.all(12)),
                  const SizedBox(height: 70,),
                  _LoginButton(),
                  //const Padding(padding: EdgeInsets.all(12)),
                  const SizedBox(height: 14,),
                  Text('or', style: TextStyle(color: Colors.blue[900], fontSize: 18, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 14,),
                  _UnLoginButton(),
                ],
              ),
            ]),
      ),
          
      
    );
  }
}

class _UnLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize:const Size(377, 40),
            primary: Colors.blue[100]
          ),
          key: const Key('loginForm_unLogin_raisedButton'),
          child: const Text('LIVE VIDEO', style: TextStyle(fontWeight: FontWeight.bold),),
          onPressed: () => context.read<LoginBloc>().add(UnLogin(context)),
        );
      },
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return SizedBox(
          width: 370,
          height: 25,
          child: TextField(
            
            key: const Key('loginForm_usernameInput_textField'),
            onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
            decoration: InputDecoration(
              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              prefixIcon: const Icon(Icons.person, color: Colors.blue,),
              hintText: 'Username',
              hintStyle: const  TextStyle(color: Colors.blue, fontSize: 18),
              errorText: state.username.invalid ? 'invalid username' : null,
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
          height: 20,
          width: 370,
          child: TextField(
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
            obscureText: true,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              prefixIcon: const Icon(Icons.lock, color: Colors.blue),
              hintText: 'Password',
              hintStyle: const  TextStyle(color: Colors.blue, fontSize: 18),
              errorText: state.password.invalid ? 'invalid password' : null,
            ),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const  Size(377, 40)
              ),
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('SIGN IN'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                              content: Text('Login or password is empty')));
                      });
      },
    );
  }
}
