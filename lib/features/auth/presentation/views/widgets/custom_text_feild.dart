import 'package:flutter/material.dart';
import 'package:new_project/core/utils/colors_data.dart';
import 'package:new_project/features/settings/data/models/enums/colors_enums.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.onChanged,
    this.obscureText = false,
    this.secoundIcon,
  });
  final String label;
  final String hint;
  final Icon icon;
  final bool? obscureText;
  final Function(String)? onChanged;

  final IconButton? secoundIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // focusNode: NextFocusNode,
      obscureText: obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'feild is required';
        }
        return null;
      },

      onChanged: onChanged,

      decoration: InputDecoration(
        fillColor: colorAssetData(context,ColorEnum.primaryColor),
        filled: true,
        prefixIcon: icon,
        suffixIcon: secoundIcon,
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: customBorder(),
        border: customBorder(),
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
    );
  }
}
