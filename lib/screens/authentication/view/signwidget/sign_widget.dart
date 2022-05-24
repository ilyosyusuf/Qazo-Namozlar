import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazonamozlar/core/constants/colors/color_const.dart';
import 'package:qazonamozlar/core/extensions/context_size.dart';
import 'package:qazonamozlar/widgets/button_widgets.dart';

class SignWidget extends StatelessWidget {
  TextEditingController emailController;
  TextEditingController passwordController;
  String appBarText;
  String emailText;
  String emailHintText;
  String passwordText;
  String passwordHintText;
  VoidCallback passwordHint;
  VoidCallback send;
  String existText;
  String enter;
  VoidCallback navigate;

  SignWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.appBarText,
    required this.emailText,
    required this.emailHintText,
    required this.passwordText,
    required this.passwordHintText,
    required this.passwordHint,
    required this.send,
    required this.existText,
    required this.enter,
    required this.navigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appBarText.tr(),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SvgPicture.asset('assets/icons/auth/logo_icon.svg')
                    ],
                  ),
                )),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.h * 0.08),
                      Text(emailText.tr()),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icons/auth/email.svg',
                                  height: 20),
                              onPressed: () {},
                            ),
                            hintText: emailHintText.tr(),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(height: context.h * 0.05),
                      Text(passwordText.tr()),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icons/auth/lock.svg',
                                  height: 20),
                              onPressed: () {},
                            ),
                            suffixIcon: IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icons/auth/eye.svg',
                                  height: 20),
                              onPressed: () {},
                            ),
                            hintText: passwordHintText.tr(),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      ),
                      SizedBox(height: context.h * 0.08),
                      ButtonWidgets(
                           child:  Text(
                            "send".tr(),
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          onPressed: send),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(existText.tr()),
                          SizedBox(
                            width: context.w * 0.015,
                          ),
                          InkWell(
                            onTap: navigate,
                            child: Text(
                              enter.tr(),
                              style:
                                  const TextStyle(color: ColorConst.kPrimaryColor),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
