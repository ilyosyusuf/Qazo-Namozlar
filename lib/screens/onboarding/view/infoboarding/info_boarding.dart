import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonamozlar/core/constants/colors/color_const.dart';
import 'package:qazonamozlar/core/extensions/context_size.dart';
import 'package:qazonamozlar/screens/onboarding/cubit/onboarding_cubit.dart';
import 'package:qazonamozlar/screens/onboarding/state/onboarding_state.dart';
import 'package:qazonamozlar/widgets/button_widgets.dart';
import 'package:qazonamozlar/widgets/info_widget.dart';

class InfoBoarding extends StatelessWidget {
  const InfoBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OnBoardCubit(), child: myScaffold(context));
  }

  Scaffold myScaffold(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonWidgets(
          child: Text(
            'registrate'.tr(),
            style: Theme.of(context).textTheme.headline5,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/mainsign', (route) => false);
          }),
      body: BlocConsumer<OnBoardCubit, OnBoardingState>(
          builder: (context, state) {
            return Stack(children: [
              PageView(
                  onPageChanged: (value) {
                    context.read<OnBoardCubit>().onChangeInfo(context,value);
                  },
                  children: const [
                    InfoWidget(),
                    InfoWidget(),
                    InfoWidget(),
                  ]),
              Positioned(
                  top: context.h * 0.1,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: DotsIndicator(
                    dotsCount: context.watch<OnBoardCubit>().splashPics.length,
                    position:
                        context.watch<OnBoardCubit>().indexSplash.toDouble(),
                    decorator: DotsDecorator(
                      activeColor: ColorConst.kPrimaryColor,
                      color: ColorConst.kPrimaryColor.withOpacity(0.5),
                      size: const Size.square(10.0),
                      activeSize: const Size(18.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ))
            ]);
          },
          listener: (context, state) {}),
    );
  }
}
