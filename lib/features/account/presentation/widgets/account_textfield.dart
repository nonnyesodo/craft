import 'package:craftman/constants/appcolors.dart';
import 'package:flutter/material.dart';

class AcctTextfield extends StatelessWidget {
  const AcctTextfield(
      {super.key,
      this.controller,
      this.keyboardtype,
      this.validator,
      this.obscure,
      this.prefixicon,
      this.suffixicon,
      this.hintext,
      this.noborder = false,
      this.enabled = true});
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final bool? obscure;
  final Widget? prefixicon, suffixicon;
  final String? hintext;
  final bool noborder, enabled;

  @override
  Widget build(BuildContext context) {
    var noboder = const OutlineInputBorder(borderSide: BorderSide.none);
    final size = MediaQuery.sizeOf(context);
    return TextFormField(
      enabled: enabled,
      obscuringCharacter: '*',
      obscureText: obscure ?? false,
      cursorColor: Appcolors.orange,
      controller: controller,
      keyboardType: keyboardtype,
      textCapitalization: TextCapitalization.sentences,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Appcolors.orange
                  : Appcolors.lightgrey),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Appcolors.orange
                  : Appcolors.lightgrey),
          filled: noborder ? false : true,
          fillColor: Appcolors.lightgrey.withOpacity(0.3),
          contentPadding: noborder
              ? EdgeInsets.zero
              : EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.width * 0.04),
          prefixIcon: prefixicon,
          suffixIcon: suffixicon,
          hintText: hintext,
          focusedBorder: noborder
              ? noboder
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  borderSide: BorderSide(color: Appcolors.orange)),
          enabledBorder: noborder
              ? noboder
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                  borderSide: BorderSide(color: Appcolors.lightgrey))),
    );
  }
}
