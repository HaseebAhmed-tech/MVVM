import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController? controller;

  final int maxLines;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final bool showOutlineBorder;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final ValueNotifier<bool> obscureText;
  const PasswordFormField(
      {super.key,
      required this.obscureText,
      this.controller,
      this.maxLines = 1,
      this.validator,
      this.onSaved,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.keyboardType = TextInputType.text,
      this.onChanged,
      this.showOutlineBorder = true,
      this.onFieldSubmitted,
      this.focusNode});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (context, value, child) {
        return TextFormField(
          controller: controller,
          enabled: true,
          focusNode: focusNode,

          autofocus: false,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText.value,

          enableSuggestions: false,
          // style: Styles.displayMedNormalStyle,
          decoration: InputDecoration(
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              filled: true,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  obscureText.value = !obscureText.value;
                },
                icon: obscureText.value
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              border: showOutlineBorder
                  ? const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    )
                  : InputBorder.none,
              // isCollapsed: true,

              focusColor: Theme.of(context).primaryColor,
              // hintStyle: Styles.displaySmNormalStyle,
              hintText: labelText ?? 'Enter a value',
              floatingLabelBehavior: FloatingLabelBehavior.never),

          keyboardType: keyboardType,
          validator: validator,
          onSaved: onSaved,
          cursorColor: Theme.of(context).focusColor,
          // Add any additional properties or configurations here
        );
      },
    );
  }
}
