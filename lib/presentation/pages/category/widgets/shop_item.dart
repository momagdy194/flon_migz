import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gshop/domain/model/model/shop_model.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/components/custom_network_image.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopItemPage extends StatelessWidget {
  final CustomColorSet colors;
  final ShopData shop;

  const ShopItemPage({Key? key, required this.colors, required this.shop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRoute.goShopPage(context: context, shop: shop);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.icon),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  topLeft: Radius.circular(16.r)),
              child: CustomNetworkImage(
                  url: shop.backgroundImg ?? shop.logoImg ?? "",
                  height: 170,
                  width: double.infinity,
                  radius: 0),
            ),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.r),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shop.translation?.title ?? "",
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 16),
                      ),
                      4.verticalSpace,
                      Text(
                        AppHelper.shopTime(shop.workingDays),
                        style: CustomStyle.interNormal(
                            color: colors.textHint, size: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/svg/start.svg"),
                  4.horizontalSpace,
                  Text(
                    shop.ratingAvg?.toStringAsPrecision(2) ?? "0.0",
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 12),
                  )
                ],
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class ShopItemPage2 extends StatelessWidget {
  final CustomColorSet colors;
  final ShopData shop;

  const ShopItemPage2({Key? key, required this.colors, required this.shop})
      : super(key: key);
  static Future<void> openMap(String latitude, String longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        openMap(shop.latLng!.latitude.toString(), shop.latLng!.longitude.toString());
        // AppRoute.goShopPage(context: context, shop: shop);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 170,
        margin: EdgeInsets.only(bottom: 10.r),
        decoration: BoxDecoration(
          color: CustomStyle.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.icon),
        ),
        child:

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 18.r),
            //   child: Row(
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             shop.translation?.title ?? "",
            //             style: CustomStyle.interSemi(
            //                 color: colors.textBlack, size: 16),
            //           ),
            //           4.verticalSpace,
            //           Text(
            //             AppHelper.shopTime(shop.workingDays),
            //             style: CustomStyle.interNormal(
            //                 color: colors.textHint, size: 14),
            //           ),
            //         ],
            //       ),
            //       const Spacer(),
            //       SvgPicture.asset("assets/svg/start.svg"),
            //       4.horizontalSpace,
            //       Text(
            //         shop.ratingAvg?.toStringAsPrecision(2) ?? "0.0",
            //         style:
            //             CustomStyle.interNoSemi(color: colors.textBlack, size: 12),
            //       )
            //     ],
            //   ),
            // ),
            Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r)),
              child: CustomNetworkImage(
                  fit: BoxFit.cover,
                  url: shop.backgroundImg ?? shop.logoImg ?? "",
                  height: 170,
                  width: 170,
                  radius: 0),
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Text(
                  shop.translation?.title ?? "",
                  style:
                      CustomStyle.interSemi(color: colors.textBlack, size: 16),
                ),
                Flexible(
                  child: Container(
                    width: (MediaQuery.of(context).size.width * .9) - 180,
                    child: Text(
                      shop.translation?.address ?? "",
                      style: CustomStyle.interSemi(
                          color: colors.textBlack, size: 16),
                      maxLines: 2,
                    ),
                  ),
                ),
                Text(shop.latLng!.latitude.toString()),
                4.verticalSpace,
                Text(
                  AppHelper.shopTime(shop.workingDays),
                  style:
                      CustomStyle.interNormal(color: colors.textHint, size: 14),
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/svg/start.svg"),
                    4.horizontalSpace,
                    Text(
                      shop.ratingAvg?.toStringAsPrecision(2) ?? "0.0",
                      style: CustomStyle.interNoSemi(
                          color: colors.textBlack, size: 12),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
