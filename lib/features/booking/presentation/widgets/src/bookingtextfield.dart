import 'package:craftman/constants/appcolors.dart';
import 'package:flutter/material.dart';

class BookingTextfield extends StatelessWidget {
  const BookingTextfield({
    super.key,
    this.controller,
    this.keyboardtype,
    this.validator,
    this.obscure,
    this.prefixicon,
    this.suffixicon,
    this.hintext,
    this.maxline,
  });
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final String? Function(String?)? validator;
  final bool? obscure;
  final Widget? prefixicon, suffixicon;
  final String? hintext;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TextFormField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        maxLines: maxline,
        obscuringCharacter: '*',
        obscureText: obscure ?? false,
        cursorColor: Appcolors.blue,
        controller: controller,
        keyboardType: keyboardtype,
        textCapitalization: TextCapitalization.sentences,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
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
            fillColor: Appcolors.lightgrey.withOpacity(0.3),
            contentPadding: EdgeInsets.zero,
            prefixIcon: prefixicon,
            suffixIcon: suffixicon,
            hintText: hintext,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide: BorderSide(color: Appcolors.blue)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide: BorderSide(color: Appcolors.lightgrey))));
  }
}
