import 'package:flutter/material.dart';
import 'package:flutter_internship/components/widgets/circle_icon.dart';
import 'package:flutter_internship/phone_shop/widgets/components/fill_button.dart';
import 'package:flutter_internship/phone_shop/widgets/components/outline_button.dart';

class Dialogs extends StatelessWidget {
  final CircleIcon circleIcon;
  final String description;
  final String title;
  final Widget button;
  final VoidCallback onTap;

  Dialogs.error({
    super.key,
    required this.description,
    required this.onTap,
    String buttonText = 'Try again',
  })  : circleIcon = const CircleIcon.error(),
        title = 'Error!',
        button = OutlineButton(onTap: onTap, buttonText: buttonText);

  Dialogs.success({
    super.key,
    required this.description,
    required this.onTap,
    String buttonText = 'Done',
  })  : circleIcon = const CircleIcon.success(),
        title = 'Success!',
        button = FillButton(onTap: onTap, buttonText: buttonText);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: const Color(0xFFFFFFFF),
      icon: circleIcon,
      iconPadding: const EdgeInsets.all(16),
      content: SizedBox(
        height: MediaQuery.sizeOf(context).height / 10,
        child: Column(
          children: [
            _Title(title: title),
            const SizedBox(height: 12),
            _Description(description: description),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      actions: <Widget>[button],
      actionsPadding: const EdgeInsets.all(16),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  const _Title({
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF000000),
          fontFamily: 'Inter',
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String description;

  const _Description({
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        description,
        style: const TextStyle(
          color: Color(0xFF787878),
          fontFamily: 'Inter',
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
