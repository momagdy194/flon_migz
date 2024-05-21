import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/domain/model/response/review_pagination_response.dart';
import 'package:gshop/domain/service/helper.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/components/custom_network_image.dart';
import 'package:gshop/presentation/route/app_route.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';

class ReviewItem extends StatelessWidget {
  final ReviewModel review;
  final CustomColorSet colors;

  const ReviewItem({super.key, required this.review, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomNetworkImage(
              url: review.user?.img ?? "",
              height: 44,
              width: 44,
              radius: 22,
              name: review.user?.firstname ?? review.user?.lastname,
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${review.user?.firstname ?? ""} ${review.user?.lastname ?? ""}",
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 15),
                ),
                4.verticalSpace,
                Row(
                  children: [
                    Text(
                      AppHelper.dateFormatForNotification(
                          review.createdAt ?? DateTime.now()),
                      style: CustomStyle.interNormal(
                          color: colors.textHint, size: 12),
                    ),
                    10.horizontalSpace,
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.textHint,
                      ),
                      height: 4.r,
                      width: 4.r,
                    ),
                    10.horizontalSpace,
                    Icon(
                      FlutterRemix.star_smile_fill,
                      color: CustomStyle.starColor,
                      size: 16.r,
                    ),
                    4.horizontalSpace,
                    Text(
                      review.rating.toString(),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        8.verticalSpace,
        if (review.galleries?.isNotEmpty ?? false)
          SizedBox(
            height: 64.r,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: review.galleries?.length ?? 0,
                itemBuilder: (context, index) {
                  return ButtonEffectAnimation(
                    onTap: () {
                      AppRoute.goReviewImages(
                          context: context,
                          index: index,
                          list: review.galleries ?? []);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: CustomNetworkImage(
                          url: review.galleries?[index].path ?? "",
                          preview: review.galleries?[index].preview,
                          height: 64,
                          width: 64,
                          radius: 2),
                    ),
                  );
                }),
          ),
        Text(
          review.comment ?? "",
          style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
        ),
        24.verticalSpace,
      ],
    );
  }
}
