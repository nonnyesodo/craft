import 'package:craftman/constants/appcolors.dart';
import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield(
      {super.key,
      this.controller,
      this.keyboardtype,
      this.validator,
      this.obscure,
      this.prefixicon,
      this.suffixicon,
      this.hintext,
      this.onChanged,
      this.enableError = false,
      this.enableFill = false,
      this.onTap});
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final bool? obscure;
  final Widget? prefixicon, suffixicon;
  final String? hintext;
  final Function(String)? onChanged;
  final bool enableError, enableFill;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TextFormField(
      onTap: onTap,
      obscuringCharacter: '*',
      obscureText: obscure ?? false,
      cursorColor: Appcolors.blue,
      controller: controller,
      keyboardType: keyboardtype,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          suffixIconColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.focused)
                  ? Appcolors.blue
                  : Appcolors.lightgrey),
          prefixIconColor: WidgetStateColor.resolveWith((states) =>
              states.contains(WidgetState.focused)
                  ? Appcolors.blue
                  : Appcolors.lightgrey),
          filled: true,
          fillColor: enableFill
              ? Appcolors.white
              : Appcolors.lightgrey.withOpacity(0.3),
          contentPadding: EdgeInsets.zero,
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
          hintText: hintext,
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              borderSide: BorderSide(color: Appcolors.redColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              borderSide: BorderSide(color: Appcolors.redColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              borderSide: BorderSide(
                  color: enableError ? Appcolors.redColor : Appcolors.blue)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width * 0.02),
              borderSide: BorderSide(color: Appcolors.lightgrey))),
    );
  }
}
