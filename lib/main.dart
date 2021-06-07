import 'package:flutter/material.dart';
import 'package:ikon_address_book/constants/constants.dart';
import 'package:ikon_address_book/screens/group_view.dart';
import 'package:ikon_address_book/services/contacts_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ContactsService _contactsService = ContactsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ikon addres book',
      theme: ThemeData(
        primarySwatch: Constants.themeColor,
      ),
      home: GroupView(
        _contactsService.getContacts(),
        header: 'Optional header',
        footer: "Optional footer",
      ),
    );
  }
}
