import 'package:flutter/material.dart';

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;

  const CustomFormButton({
    Key? key,
    required this.innerText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(26),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            innerText,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ));
  }
}
