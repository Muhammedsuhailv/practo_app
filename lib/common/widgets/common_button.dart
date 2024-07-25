import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? textColor;

  const CommonButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed;
      },
      child: Container(
        child: Center(child: Text(buttonText,style: TextStyle(fontWeight: FontWeight.w600),)),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(7),border: Border.all(width: 1,color: Colors.black54)),
      ),
    );
  }
}