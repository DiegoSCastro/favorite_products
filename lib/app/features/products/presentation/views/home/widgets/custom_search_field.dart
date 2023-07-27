import 'package:flutter/material.dart';

import '../../../../../../app.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String labelText;
  const CustomSearchField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText = 'Search Anything',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: labelText,
          hintStyle: context.text.body1.copyWith(color: context.colors.blackMedium),
          filled: true,
          fillColor: context.colors.lightGray,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16, right: 10),
            child: Icon(
              Icons.search,
              size: 24,
              color: context.colors.blackNormal,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
