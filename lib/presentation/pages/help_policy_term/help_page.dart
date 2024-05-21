import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/application/profile/profile_bloc.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/components/button/pop_button.dart';
import 'package:gshop/presentation/components/custom_scaffold.dart';
import 'package:gshop/presentation/components/loading.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                PopButton(color: colors.textBlack),
                8.horizontalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.helpInfo),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
              ],
            ),
            24.verticalSpace,
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return state.isHelpLoading
                    ? const Center(child: Loading())
                    : Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16.r),
                            shrinkWrap: true,
                            itemCount: state.helps.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 8.r),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 16.r),
                                decoration: BoxDecoration(
                                  color: colors.newBoxColor,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                      dividerColor: colors.transparent),
                                  child: ExpansionTile(
                                    iconColor: colors.textHint,
                                    title: Text(
                                      state.helps[index].translation
                                              ?.question ??
                                          "",
                                      style: CustomStyle.interNormal(
                                          color: colors.textBlack, size: 14),
                                    ),
                                    children: [
                                      Text(
                                        state.helps[index].translation
                                                ?.answer ??
                                            "",
                                        style: CustomStyle.interNormal(
                                            color: colors.textBlack, size: 14),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => ButtonEffectAnimation(
        onTap: () {
          if (LocalStorage.getToken().isEmpty) {
            AppRoute.goLogin(context);
            return;
          }
          AppRoute.goChat(
            context: context,
            senderId: LocalStorage.getAdminId(),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 22.r, horizontal: 28.r),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FlutterRemix.message_3_fill,
                color: colors.white,
              ),
              10.horizontalSpace,
              Text(
                AppHelper.getTrn(TrKeys.onlineChat),
                style:
                    CustomStyle.interNoSemi(color: CustomStyle.white, size: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
