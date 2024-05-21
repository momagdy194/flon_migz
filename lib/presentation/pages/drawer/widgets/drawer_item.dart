import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gshop/presentation/components/button/animation_button_effect.dart';
import 'package:gshop/presentation/style/style.dart';
import 'package:gshop/presentation/style/theme/theme.dart';

class DrawerItem extends StatelessWidget {
  final CustomColorSet colors;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({
    Key? key,
    required this.colors,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: onTap,
      child: Column(
        children: [
          16.verticalSpace,
          Row(
            children: [
              Icon(
                icon,
                color: colors.textBlack,
              ),
              12.horizontalSpace,
              Expanded(
                child: Text(
                  title,
                  style:
                      CustomStyle.interNormal(color: colors.textBlack, size: 16),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Divider(
            color: colors.textHint,
          )
        ],
      ),
    );
  }
}
