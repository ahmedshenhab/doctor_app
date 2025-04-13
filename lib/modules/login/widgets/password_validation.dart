import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSepcialChar,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSepcialChar;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidatorRown(
          'At least 1 lowercase letter',
          hasLowercase,
        ),
        const SizedBox(height: 2),
        buildValidatorRown(
          'At least 1 uppercase letter',
          hasUppercase,
        ),
        const SizedBox(height: 2),
        buildValidatorRown(
          'At least 1 special character',
          hasSepcialChar,
        ),
        const SizedBox(height: 2),
        buildValidatorRown(
          'At least 1 number letter',
          hasNumber,
        ),
        const SizedBox(height: 2),
        buildValidatorRown(
          'At least 8 characters long',
          hasMinLength,
        ),
      ],
    );
  }

  Widget buildValidatorRown(String text, bool isValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,

          backgroundColor: ColorManager.grey,
        ),
        const SizedBox(width: 6),

        Text(
          text,
          style: TextStyles.font13darkBlueRegular.copyWith(
            decoration:
                isValidated
                    ? TextDecoration.lineThrough
                    : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color:
                isValidated
                    ? ColorManager.grey
                    : ColorManager.darkBlue,
          ),
        ),
      ],
    );
  }
}
