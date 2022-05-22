import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonamozlar/core/constants/paddingmargin/pm_const.dart';
import 'package:qazonamozlar/core/extensions/context_size.dart';
import 'package:qazonamozlar/screens/onboarding/cubit/onboarding_cubit.dart';


class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SizedBox(
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/onboardinfo/loader.gif'),
            image: AssetImage(context
                .watch<OnBoardCubit>()
                .splashPics[context.watch<OnBoardCubit>().indexSplash]),
            fit: BoxFit.cover,
          ),
        )),
         Expanded(child: Padding(
           padding: PMconst.medium,
           child: SizedBox(
            child: Column(
              children: [
                SizedBox(height: context.h * 0.070),
                Text('namoztolatokis'.tr(), style: Theme.of(context).textTheme.headline4,),
                Text('onboarddefinition'.tr(), style: Theme.of(context).textTheme.headline6,)
              ],
            ),
                 ),
         ))
      ],
    );
  }
}