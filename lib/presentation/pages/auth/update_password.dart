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
import 'package:gshop/presentation/components/button/custom_button.dart';
import 'package:gshop/presentation/components/custom_textformfield.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';

class UpdatePasswordScreen extends StatefulWidget {
  final CustomColorSet colors;
  final String phone;

  const UpdatePasswordScreen(
      {super.key, required this.colors, required this.phone});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  late TextEditingController password;
  late TextEditingController confirmPassword;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    confirmPassword = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    confirmPassword.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.r,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.updatePassword),
                  style: CustomStyle.interNoSemi(
                      color: widget.colors.textBlack, size: 30),
                ),
                32.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (l, n) {
                    return l.isShowPassword != n.isShowPassword;
                  },
                  builder: (context, state) {
                    return CustomTextFormField(
                      obscure: state.isShowPassword,
                      controller: password,
                      validation: AppValidators.isValidPassword,
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
                      hint: AppHelper.getTrn(TrKeys.password),
                    );
                  },
                ),
                16.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (l, n) {
                    return l.isShowConfirmPassword != n.isShowConfirmPassword;
                  },
                  builder: (context, state) {
                    return CustomTextFormField(
                      obscure: state.isShowConfirmPassword,
                      controller: confirmPassword,
                      validation: (s) => AppValidators.isValidConfirmPassword(
                          password.text, s),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context
                              .read<AuthBloc>()
                              .add(const AuthEvent.showConfirmPassword());
                        },
                        icon: Icon(
                          !state.isShowConfirmPassword
                              ? FlutterRemix.eye_close_line
                              : FlutterRemix.eye_line,
                          color: widget.colors.textBlack,
                        ),
                      ),
                      hint: AppHelper.getTrn(TrKeys.confirmPassword),
                    );
                  },
                ),
                24.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (l, n) {
                    return l.isLoading != n.isLoading;
                  },
                  builder: (context, state) {
                    return CustomButton(
                        title: AppHelper.getTrn(TrKeys.updatePassword),
                        bgColor: widget.colors.primary,
                        titleColor: CustomStyle.white,
                        isLoading: state.isLoading,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context
                                .read<AuthBloc>()
                                .add(AuthEvent.forgotPasswordAfter(
                                    context: context,
                                    phone: widget.phone,
                                    password: password.text,
                                    onSuccess: () async{
                                      await    LocalStorage.setAddress(
                                        AddressModel(
                                          // cityId: int.tryParse(cityId),
                                          countryId: 67,
                                          regionId: 3,
                                          // regionId: int.tryParse(regionId),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
