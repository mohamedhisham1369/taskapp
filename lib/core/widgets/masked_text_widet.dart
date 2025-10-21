import 'package:flutter/material.dart';

class MaskedTextWidget extends StatelessWidget {
  const MaskedTextWidget({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    String maskedData =
        data.contains('@') ? maskEmail(data) : maskPhoneNumber(data);

    return Text(
      maskedData,
    );
  }

  String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length > 14) {
      return '${phoneNumber.substring(0, 8)}******${phoneNumber.substring(14)}';
    } else {
      return phoneNumber;
    }
  }

  String maskEmail(String email) {
    int atIndex = email.indexOf('@');
    String localPart = email.substring(0, atIndex);
    String gmail = email.substring(atIndex);

    if (localPart.length > 3) {
      return '${localPart.substring(0, 3)}***$gmail';
    } else {
      return '${localPart.substring(0, 1)}***$gmail';
    }
  }
}
