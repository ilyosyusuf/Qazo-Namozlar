import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonamozlar/screens/authentication/cubit/auth_cubit.dart';
import 'package:qazonamozlar/screens/authentication/state/auth_state.dart';
import 'package:qazonamozlar/screens/authentication/view/signwidget/sign_widget.dart';
import 'package:qazonamozlar/widgets/my_messenger.dart';

class MainSign extends StatelessWidget {
  const MainSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: myScaffold(),
    );
  }

  Scaffold myScaffold() => Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: ((context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is SignUpState) {
              var data = context.watch<AuthCubit>();
              return SignWidget(
                  emailController: data.emailController,
                  passwordController: data.passwordController,
                  appBarText: "registrate",
                  emailText: "email",
                  emailHintText: "emailwrite",
                  passwordText: "passwordcreate",
                  passwordHintText: "passwordwrite",
                  passwordHint: () {},
                  send: () {
                    context.read<AuthCubit>().signUp(
                        context,
                        data.emailController.text,
                        data.passwordController.text);
                  },
                  existText: "exist",
                  enter: "enter",
                  navigate: () {
                    context.read<AuthCubit>().changeState(SignInState());
                  });
            } else if (state is SignInState) {
              var data = context.watch<AuthCubit>();
              return SignWidget(
                  emailController: data.emailController,
                  passwordController: data.passwordController,
                  appBarText: "signin",
                  emailText: "enteremail",
                  emailHintText: "emailwrite",
                  passwordText: "enterpassword",
                  passwordHintText: "password",
                  passwordHint: () {},
                  send: () {
                    context.read<AuthCubit>().signIn(
                        context,
                        data.emailController.text,
                        data.passwordController.text);
                  },
                  existText: "new",
                  enter: "register",
                  navigate: () {
                    context.read<AuthCubit>().changeState(SignUpState());
                  });
            }
            else if (state is AuthError) {
             return MyMessenger.messenger(
                  context, state.errorText, Colors.red);
            }  
            else {
              return Container();
            }
          }),
        ),
      );
}
