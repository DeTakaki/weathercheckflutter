import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/sizes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.textController,
    required this.validator,
    this.obscureFields = false,
    this.hint,
  });

  final String title;
  final FormFieldValidator<String>? validator;
  final TextEditingController textController;
  final bool obscureFields;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.lightGray),
        ),
        gapH2,
        TextFormField(
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
          controller: textController,
          keyboardType: TextInputType.number,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          obscureText: obscureFields,
          decoration: InputDecoration(
            hintText: hint ?? '',
            hintStyle: const TextStyle(color: AppColors.lighterTextColor),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGray),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Sizes.p8,
              vertical: Sizes.p8,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: null,
          ),
        )
      ],
    );
  }
}
