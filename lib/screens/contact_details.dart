import 'package:flutter/material.dart';
import 'package:ikon_address_book/constants/constants.dart';

class ContactNameDetails extends StatelessWidget {
  const ContactNameDetails(this._contactName, {Key key}) : super(key: key);
  final String _contactName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          _contactName,
          textScaleFactor: Constants.contactScreenNameScaleFactor,
        ),
      ),
    );
  }
}
