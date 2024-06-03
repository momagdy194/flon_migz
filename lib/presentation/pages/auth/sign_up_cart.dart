import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/app_constants.dart';
import 'package:gshop/application/auth/auth_bloc.dart';
import 'package:gshop/domain/model/model/address_model.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/domain/service/validators.dart';
import 'package:gshop/infrastructure/firebase/firebase_service.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';
import 'package:gshop/presentation/components/button/custom_button.dart';
import 'package:gshop/presentation/components/custom_textformfield.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';

import 'widgets/social_button.dart';

class SignUpCart extends StatefulWidget {
  final CustomColorSet colors;
  final TextEditingController phone;

  const SignUpCart({
    Key? key,
    required this.colors,
    required this.phone,
  }) : super(key: key);

  @override
  State<SignUpCart> createState() => _SignUpCartState();
}

class _SignUpCartState extends State<SignUpCart> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380.r,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppHelper.getTrn(TrKeys.signUp),
                    style: CustomStyle.interNoSemi(
                        color: widget.colors.white, size: 30),
                  ),
                  32.verticalSpace,
                  CustomTextFormField(
                     fillColor: Colors.black87,
                    filled: true,
                    validation: AppValidators.isNotEmptyValidator,
                    controller: widget.phone,
                    hint: AppHelper.getTrn(TrKeys.phoneNumber),
                    inputType: TextInputType.phone,
                  ),
                  16.verticalSpace,
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (l, n) {
                      return l.isLoading != n.isLoading;
                    },
                    builder: (context, state) {
                      return CustomButton(
                          isLoading: state.isLoading,
                          title: AppHelper.getTrn(TrKeys.signUp),
                          bgColor: widget.colors.primary,
                          titleColor: CustomStyle.white,
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              if (AppHelper.checkPhone(
                                  widget.phone.text.replaceAll(" ", ""))) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthEvent.checkPhone(
                                        context: context,
                                        phone: widget.phone.text,
                                        onSuccess: () {
                                          FirebaseService.sendCode(
                                              phone: widget.phone.text,
                                              onSuccess: (id) {
                                                context.read<AuthBloc>().add(
                                                    AuthEvent.setVerificationId(
                                                        id: id));
                                              },
                                              onError: (e) {
                                                AppHelper.errorSnackBar(
                                                    context: context,
                                                    message: e);
                                              });
                                        }));
                              } else {
                                AppHelper.errorSnackBar(
                                    context: context,
                                    message: AppHelper.getTrn(
                                        TrKeys.thisNotPhoneNumber));
                              }
                            }
                          });
                    },
                  ),
                  16.verticalSpace,
                  Divider(
                    color: widget.colors.icon,
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: AppConstants.socialSignIn
                        .map((e) => SocialButton(
                              iconColor: widget.colors.textBlack,
                              bgColor: widget.colors.socialButtonColor,
                              icon: e,
                              onTap: () {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthEvent.socialSignIn(
                                        context: context,
                                        type: e,
                                        onSuccess: () async {
                                          await LocalStorage.setAddress(
                                            AddressModel(
                                              // cityId: int.tryParse(cityId),
                                              countryId: 67,
                                              regionId:
                                                  3, // regionId: int.tryParse(regionId),
                                            ),
                                          );

                                          if (LocalStorage.getAddress() ==
                                              null) {
                                            AppRoute.goSelectCountry(
                                                context: context);
                                            return;
                                          }
                                          if (AppConstants.isDemo &&
                                              LocalStorage.getUiType() ==
                                                  null) {
                                            AppRoute.goSelectUIType(
                                                context: context);
                                            return;
                                          }
                                          AppRoute.goMain(context);
                                        }));
                              },
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
