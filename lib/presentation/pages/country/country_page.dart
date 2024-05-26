import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/app_constants.dart';
import 'package:gshop/application/address/address_bloc.dart';
import 'package:gshop/domain/model/model/address_model.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/domain/service/tpying_delay.dart';
import 'package:gshop/domain/service/tr_keys.dart';
import 'package:gshop/infrastructure/local_storage/local_storage.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/components/button/pop_button.dart';
import 'package:gshop/presentation/components/custom_network_image.dart';
import 'package:gshop/presentation/components/custom_scaffold.dart';
import 'package:gshop/presentation/components/custom_textformfield.dart';
import 'package:gshop/presentation/components/keyboard_dismisser.dart';
import 'package:gshop/presentation/components/loading.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final RefreshController controller = RefreshController();
  final Delayed delayed = Delayed(milliseconds: 700);

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 0),
      () {
        // AppRoute.goMain(context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: (colors) => KeyboardDismisser(
              isLtr: LocalStorage.getLangLtr(),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Row(
                      children: [
                        PopButton(color: colors.textBlack),
                        8.horizontalSpace,
                        Text(
                          AppHelper.getTrn(TrKeys.selectCountry),
                          style: CustomStyle.interNoSemi(
                              color: colors.textBlack, size: 18),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: CustomTextFormField(
                        hint: AppHelper.getTrn(TrKeys.search),
                        onChanged: (s) {
                          if (s.trim().isNotEmpty) {
                            delayed.run(() {
                              context.read<AddressBloc>().add(
                                  AddressEvent.searchCountry(
                                      context: context, search: s));
                            });
                          }
                        },
                      ),
                    ),
                    BlocBuilder<AddressBloc, AddressState>(
                      builder: (context, state) {
                        return state.isLoading
                            ? Padding(
                                padding: EdgeInsets.only(top: 32.r),
                                child: const Loading(),
                              )
                            : Expanded(
                                child: SmartRefresher(
                                  controller: controller,
                                  enablePullDown: false,
                                  enablePullUp: true,
                                  onLoading: () {
                                    context.read<AddressBloc>().add(
                                        AddressEvent.fetchCountry(
                                            context: context,
                                            controller: controller));
                                  },
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(16.r),
                                    itemCount: state.countries.length,
                                    itemBuilder: (context, index) {
                                      return _countryItem(colors, state, index);
                                    },
                                  ),
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
            ));
  }

  Widget _countryItem(CustomColorSet colors, AddressState state, int index) {
    return ButtonEffectAnimation(
      onTap: () {
        LocalStorage.deleteCartList();
        LocalStorage.setAddress(AddressModel(
            countryId:
            // null,
            state.countries[index].id,
            regionId:
            // null,
            state.countries[index].regionId,
            countryCode:
            // null,
            state.countries[index].code,
            country:
            // null
            state.countries[index].translation?.title
        ));

        // if ((state.countries[index].citiesCount ?? 0) > 0) {
        //   AppRoute.goSelectCity(
        //       context: context, countryId: state.countries[index].id ?? 0);
        //   return;
        // }
        if (AppConstants.isDemo && LocalStorage.getUiType() == null) {
          AppRoute.goSelectUIType(context: context);
          return;
        }
        AppRoute.goMain(context);
      },
      child: Column(
        children: [
          Row(
            children: [
              CustomNetworkImage(
                  url: state.countries[index].img ?? "",
                  height: 20,
                  width: 30,
                  radius: 0),
              16.horizontalSpace,
              AutoSizeText(
                state.countries[index].translation?.title ?? "",
                style: CustomStyle.interNormal(
                    color: LocalStorage.getAddress()?.countryId ==
                            state.countries[index].id
                        ? colors.primary
                        : colors.textBlack,
                    size: 12),
                minFontSize: 6,
                maxFontSize: 14,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              if (LocalStorage.getAddress()?.countryId ==
                  state.countries[index].id)
                Icon(
                  FlutterRemix.check_line,
                  color: colors.primary,
                )
            ],
          ),
          8.verticalSpace,
          const Divider(),
          8.verticalSpace,
        ],
      ),
    );
  }
}
