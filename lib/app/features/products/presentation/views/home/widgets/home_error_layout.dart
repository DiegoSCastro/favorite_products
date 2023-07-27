import 'package:flutter/material.dart';

import '../../../../../../app.dart';

class HomeErrorLayout extends StatelessWidget {
  final VoidCallback onTapButton;
  const HomeErrorLayout({super.key, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox.shrink(),
        CustomPlaceholder(
          showPlaceholder: true,
          message: 'Something went wrong!',
          svgPicture: context.assets.errorPlaceholder,
          child: const SizedBox.shrink(),
        ),
        TextButton(
          onPressed: onTapButton,
          child: Text(
            'Go Home',
            style: context.text.body1SemiBold,
          ),
        ),
      ],
    );
  }
}
