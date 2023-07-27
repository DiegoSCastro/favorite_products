import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../app.dart';

class CustomPlaceholder extends StatelessWidget {
  final bool showPlaceholder;
  final String message;
  final String svgPicture;
  final Widget child;
  const CustomPlaceholder({
    super.key,
    required this.showPlaceholder,
    required this.message,
    required this.svgPicture,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return showPlaceholder
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  svgPicture,
                  height: 160,
                  width: 160,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    message,
                    style: context.text.body1SemiBold
                        .copyWith(color: context.colors.blackMedium),
                  ),
                ),
              ],
            ),
          )
        : child;
  }
}
