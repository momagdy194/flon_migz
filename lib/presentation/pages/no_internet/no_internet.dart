import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/style/style.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: CustomStyle.white,
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppHelper.getTrn(TrKeys.noInternet),
              style: CustomStyle.interSemi(color: CustomStyle.black, size: 20),
            ),
            24.verticalSpace,
            ButtonEffectAnimation(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: CustomStyle.primary,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.r,
                ),
                child: Center(
                  child:Text(
                    AppHelper.getTrn(TrKeys.retry),
                    style: CustomStyle.interNoSemi(color: CustomStyle.white),
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
