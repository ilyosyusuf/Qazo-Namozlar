import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonamozlar/screens/onboarding/cubit/onboarding_cubit.dart';
import 'package:qazonamozlar/screens/onboarding/state/onboarding_state.dart';
import 'package:qazonamozlar/screens/onboarding/view/splashandlang/lang_page.dart';
import 'package:qazonamozlar/screens/onboarding/view/splashandlang/splash_page.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardCubit(),
      child: mainScafold(),
    );
  }

  Scaffold mainScafold() {
    return Scaffold(
      body: BlocConsumer<OnBoardCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: ((context, state) {
          if (state is SplashInitial) {
            return const SplashView();
          } else if (state is LangState) {
            return const LangView();
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
