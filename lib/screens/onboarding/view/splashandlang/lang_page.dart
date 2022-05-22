import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazonamozlar/config/changelang/chaange_lang.dart';
import 'package:qazonamozlar/core/constants/colors/color_const.dart';
import 'package:qazonamozlar/core/constants/icons/icon_const.dart';
import 'package:qazonamozlar/core/constants/paddingmargin/pm_const.dart';
import 'package:qazonamozlar/core/extensions/context_size.dart';
import 'package:qazonamozlar/screens/onboarding/cubit/onboarding_cubit.dart';

class LangView extends StatelessWidget {
  const LangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<OnBoardCubit>();
    return Scaffold(
      body: Padding(
        padding: PMconst.medium,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.h * 0.150,
              ),
              IconConst.logogreen,
              SizedBox(height: context.h * 0.1),
              Text('Tilni tanlang / Выберите язык',
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: context.h * 0.4,
                child: ListView.builder(
                  itemBuilder: (_, __) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: context.h * 0.010),
                      child: SizedBox(
                        height: context.h * 0.080,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  ChangeLocale.changeLocalization(context, data.langcodes[__]);
                                  context
                                      .read<OnBoardCubit>()
                                      .changeLang(context);
                                },
                                splashColor: ColorConst.kPrimaryColor,
                                child: ListTile(
                                  title: Text(
                                    data.languages[__],
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(data.pic[__]),
                                  ),
                                ),
                              ),
                              Divider(
                                height: context.h * 0.001,
                                color: ColorConst.black,
                              )
                            ]),
                      ),
                    );
                  },
                  itemCount: data.languages.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}