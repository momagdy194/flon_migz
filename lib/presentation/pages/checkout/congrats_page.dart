import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/presentation/components/button/custom_button.dart';
import 'package:gshop/presentation/components/custom_scaffold.dart';
import 'package:gshop/presentation/style/style.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              // Text(
              //   AppHelper.getTrn(TrKeys.checkout),
              //   style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
              // ),
              42.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Image.asset("assets/images/kingdom.png"),
              ),
              6.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.congrats),
                      style: CustomStyle.interBold(
                          color: colors.textBlack, size: 20),
                    ),
                    6.verticalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.thankYouPurchase),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 14),
                    ),
                    // Text(
                    //   AppHelper.getTrn(TrKeys.yourOrderShipping),
                    //   style: CustomStyle.interNormal(
                    //       color: colors.textBlack, size: 14),
                    // ),
                  ],
                ),
              ),
              20.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Text(AppHelper.getTrn(TrKeys.yourOrderReady),
                    style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
                ),
              ),
              15.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: TimerCountdown(
                  format: CountDownTimerFormat.hoursMinutesSeconds,
                  secondsDescription: AppHelper.getTrn(TrKeys.seconds),
                  minutesDescription: AppHelper.getTrn(TrKeys.minutes),
                  hoursDescription: AppHelper.getTrn(TrKeys.hours),
                  colonsTextStyle: CustomStyle.interSemi(color: colors.textBlack,),
                  descriptionTextStyle: CustomStyle.interSemi(color: colors.textBlack,),
                  timeTextStyle: CustomStyle.interSemi(color: colors.textBlack,),
                  endTime: DateTime.now().add(
                    Duration(
                      hours: 2,
                      minutes: 0,
                      seconds: 0,
                    ),
                  ),
                  onEnd: () {
                    print("Timer finished");
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SizedBox(
          height: 60.r,
          child: CustomButton(
            title: AppHelper.getTrn(TrKeys.returnHome),
            bgColor: colors.primary,
            titleColor: colors.white,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
