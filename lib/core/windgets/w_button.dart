import 'package:flutter/material.dart';

class WAuthButton extends StatelessWidget {
  final String label;
  final Function() ontap;
  final Icon? icon;

  const WAuthButton({
    super.key,
    required this.label,
    required this.ontap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ontap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      height: 50,
      color: Colors.grey,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("$label", style: TextStyle(fontSize: 25)),
          if (icon != null) ...[SizedBox(width: 10), icon!],
        ],
      ),
    );
  }
}
