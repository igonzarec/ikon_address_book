import 'package:ikon_address_book/models/named_element.dart';

class ContactsService {
  List<NamedElement> getContacts() {
    final contacts = <NamedElement>[
      Contact('Marco Franco'),
      Contact ('Raul Alday'),
      Contact ('Jessica Alba'),
      Contact ('Roger Waters'),
      Contact ('Darth Vader'),
      Contact ('Homer Simpson'),
      Contact ('Bill Gates'),
      Contact ('Elon Musk'),
      Contact ('Enrique Peña'),
      Contact ('Angeles Rodriguez'),
      Contact ('Monica Alvarado'),
      Contact ('Estrella Fugaz'),
      Contact ('Juana Lopez'),
    ];
    return contacts;
  }
}

class Contact extends NamedElement {
  final String name;

  Contact(this.name);

  @override
  String getName() {
    return name;
  }

}