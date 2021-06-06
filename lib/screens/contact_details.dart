import 'package:flutter/material.dart';

class ContactNameDetails extends StatelessWidget {
  const ContactNameDetails(this.contactName, {Key key}) : super(key: key);
  final String contactName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          contactName,
          textScaleFactor: 3,
        ),
      ),
    );
  }
}
