import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/application/auth/auth_bloc.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/domain/service/validators.dart';
import 'package:gshop/infrastructure/firebase/firebase_service.dart';
import 'package:gshop/presentation/components/button/custom_button.dart';
import 'package:gshop/presentation/components/custom_textformfield.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final CustomColorSet colors;
  final TextEditingController phone;

  const ForgetPasswordScreen(
      {super.key, required this.colors, required this.phone});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.r,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.forgetPassword),
                  style: CustomStyle.interNoSemi(
                      color: widget.colors.textBlack, size: 30),
                ),
                32.verticalSpace,
                CustomTextFormField(
                  validation: AppValidators.isNotEmptyValidator,
                  controller: widget.phone,
                  hint: AppHelper.getTrn(TrKeys.phoneNumber),
                  inputType: TextInputType.phone,
                ),
                32.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (l, n) {
                    return l.isLoading != n.isLoading;
                  },
                  builder: (context, state) {
                    return CustomButton(
                        isLoading: state.isLoading,
                        title: AppHelper.getTrn(TrKeys.continueText),
                        bgColor: widget.colors.primary,
                        titleColor: CustomStyle.white,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            if (AppHelper.checkPhone(
                                widget.phone.text.replaceAll(" ", ""))) {
                              context.read<AuthBloc>().add(AuthEvent.checkPhone(
                                  context: context,
                                  phone: widget.phone.text,
                                  onSuccess: () {
                                    if (widget.phone.text.startsWith('015') ||widget.phone.text.startsWith('15') ||
                                        widget.phone.text.startsWith('2015') ||
                                        widget.phone.text.startsWith('+2015')) {
                                      context.read<AuthBloc>().add(
                                          AuthEvent.setVerificationId(
                                              contant: true,
                                              id: widget.phone.text));
                                    } else {
                                      FirebaseService.sendCode(
                                          phone: widget.phone.text,
                                          onSuccess: (id) {
                                            // if(phone.text.contains('015')){
                                            context.read<AuthBloc>().add(
                                                AuthEvent.setVerificationId(
                                                    contant: true, id: id));
                                            // }
                                          },
                                          onError: (e) {
                                            AppHelper.errorSnackBar(
                                                context: context, message: e);
                                          });
                                    }

                                    // FirebaseService.sendCode(
                                    //     phone: widget.phone.text,
                                    //     onSuccess: (id) {
                                    //       context.read<AuthBloc>().add(
                                    //           AuthEvent.setVerificationId(
                                    //               id: id));
                                    //     },
                                    //     onError: (e) {
                                    //       AppHelper.errorSnackBar(
                                    //           context: context, message: e);
                                    //     });
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
                32.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
