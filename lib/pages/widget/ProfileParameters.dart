import 'package:flutter/material.dart';
import 'package:park/utils/colors.dart';

class ProfileParameters extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
   ProfileParameters({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? AppColors.pureColor : AppColors.mainBlackColor;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: iconColor.withOpacity(0.1)),
        child: Icon(Icons.settings, color: iconColor),
      ),
      title: Text("Settings",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.apply(color: textColor, fontWeightDelta: 16, fontSizeDelta: 3)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.pureColor.withOpacity(0.1),
              ),
              child: Icon(Icons.arrow_forward_ios_outlined,
                  size: 18.0, color: Colors.grey.withOpacity(0.1)),
            )
          : null,
    );
  }
}
