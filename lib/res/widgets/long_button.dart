import 'package:flutter/material.dart';
import 'package:mvvm_rest/res/colors.dart';

class LongButton extends StatelessWidget {
  final double height;
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final bool loading;

  const LongButton({
    super.key,
    required this.height,
    required this.loading,
    this.onPressed,
    this.text = 'Login',
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: loading
            ? CircularProgressIndicator(
                color: AppColors.whiteColor,
              )
            : Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
      ),
    );
  }
}
