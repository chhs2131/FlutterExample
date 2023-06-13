import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (!state.isLoading) {
                  return Text("${state.toString()}");
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Center(
                child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                  print('build');
                  if (state.isLogin) {
                    return Column(children: [
                      Text("${state.message}"),
                      LogoutButton(),
                    ]);
                  } else {
                    return Column(children: [
                      Text("${state.message}"),
                      LoginForm(),
                    ]);
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final id = TextEditingController();
  final pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("😎 환영합니다! 😎", style: TextStyle(fontSize: 20)),
        TextField(controller: id),
        TextField(controller: pw),
        TextButton(
          onPressed: () {
            BlocProvider.of<LoginCubit>(context).tryLogin(id.text, pw.text);
          },
          child: const Text("로그인"),
        )
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        BlocProvider.of<LoginCubit>(context).tryLogout();
      },
      child: const Text("로그아웃"),
    );
  }
}
