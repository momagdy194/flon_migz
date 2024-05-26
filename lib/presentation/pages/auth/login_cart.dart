import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/app_constants.dart';
import 'package:gshop/application/auth/auth_bloc.dart';
import 'package:gshop/domain/model/model/address_model.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/domain/service/validators.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/components/button/custom_button.dart';
import 'package:gshop/presentation/components/custom_textformfield.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';

import 'widgets/social_button.dart';

class LoginCart extends StatefulWidget {
  final CustomColorSet colors;

  const LoginCart({Key? key, required this.colors}) : super(key: key);

  @override
  State<LoginCart> createState() => _LoginCartState();
}

class _LoginCartState extends State<LoginCart> {
  late TextEditingController phone;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phone = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 500.r,
        child: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            20.verticalSpace,
                            Text(
                              AppHelper.getTrn(TrKeys.login),
                              style: CustomStyle.interNoSemi(
                                  color: widget.colors.textBlack, size: 30),
                            ),
                            32.verticalSpace,
                            CustomTextFormField(
                              validation: AppValidators.isNotEmptyValidator,
                              controller: phone,
                              hint: AppHelper.getTrn(TrKeys.phoneNumberOrEmail),
                            ),
                            16.verticalSpace,
                            BlocBuilder<AuthBloc, AuthState>(
                              buildWhen: (l, n) {
                                return l.isShowPassword != n.isShowPassword;
                              },
                              builder: (context, state) {
                                return CustomTextFormField(
                                  obscure: state.isShowPassword,
                                  controller: password,
                                  validation: AppValidators.isValidPassword,
                                  hint: AppHelper.getTrn(TrKeys.password),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      context
                                          .read<AuthBloc>()
                                          .add(const AuthEvent.showPassword());
                                    },
                                    icon: Icon(
                                      !state.isShowPassword
                                          ? FlutterRemix.eye_close_line
                                          : FlutterRemix.eye_line,
                                      color: widget.colors.textBlack,
                                    ),
                                  ),
                                );
                              },
                            ),
                            16.verticalSpace,
                            BlocBuilder<AuthBloc, AuthState>(
                              buildWhen: (l, n) {
                                return l.isLoading != n.isLoading;
                              },
                              builder: (context, state) {
                                return CustomButton(
                                    isLoading: state.isLoading,
                                    title: AppHelper.getTrn(TrKeys.signIn),
                                    bgColor: widget.colors.primary,
                                    titleColor: CustomStyle.white,
                                    onTap: () {
                                      if (formKey.currentState?.validate() ?? false) {
                                        context.read<AuthBloc>().add(AuthEvent.login(
                                            context: context,
                                            phone: phone.text,
                                            password: password.text,
                                            onSuccess: ()async {
                                              await    LocalStorage.setAddress(
                                                AddressModel(
                                                  // cityId: int.tryParse(cityId),
                                                  countryId: 67,
                                                  regionId: 3,  // regionId: int.tryParse(regionId),
                                                ),
                                              );
                                              if (LocalStorage.getAddress() == null) {
                                                AppRoute.goSelectCountry(
                                                    context: context);
                                                return;
                                              }
                                              if(AppConstants.isDemo && LocalStorage.getUiType() == null){
                                                AppRoute.goSelectUIType(context: context);
                                                return;
                                              }
                                              AppRoute.goMain(context);
                                            }));
                                      }
                                    });
                              },
                            ),
                            24.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                    ButtonEffectAnimation(
                      onTap: () {
                        context.read<AuthBloc>().add(
                            const AuthEvent.switchScreen(AuthType.forgetPassword));
                      },
                      child: Text(
                        AppHelper.getTrn(TrKeys.forgetPassword),
                        style:
                            CustomStyle.interNormal(color: widget.colors.textBlack),
                      ),
                    ),
                    16.verticalSpace,
                    Divider(
                      color: widget.colors.icon,
                    ),
                    // 16.verticalSpace,
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: AppConstants.socialSignIn
                    //       .map((e) => SocialButton(
                    //             iconColor: widget.colors.textBlack,
                    //             bgColor: widget.colors.socialButtonColor,
                    //             icon: e,
                    //             onTap: () {
                    //               context.read<AuthBloc>().add(AuthEvent.socialSignIn(
                    //                   context: context,
                    //                   type: e,
                    //                   onSuccess: () {
                    //                     // if (LocalStorage.getAddress() == null) {
                    //                       AppRoute.goSelectCountry(context: context);
                    //                     //   return;
                    //                     // }
                    //                     // if(AppConstants.isDemo && LocalStorage.getUiType() == null){
                    //                     //   AppRoute.goSelectUIType(context: context);
                    //                     //   return;
                    //                     // }
                    //                     // AppRoute.goMain(context);
                    //                   }));
                    //             },
                    //           ))
                    //       .toList(),
                    // ),
                    // 24.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
