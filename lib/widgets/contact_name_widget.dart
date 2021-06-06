import 'package:flutter/material.dart';
import 'package:ikon_address_book/constants/constants.dart';
import 'package:ikon_address_book/screens/contact_details.dart';

class ContactNameWidget extends StatelessWidget {
  const ContactNameWidget(this._contactName, {Key key, this.header : "", this.footer : ""})
      : super(key: key);

  final String header, footer, _contactName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ContactNameDetails(_contactName)),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('$header', textScaleFactor: 1.5,),
              Text('$_contactName', textAlign: TextAlign.center,
                  textScaleFactor: Constants.contactNameScaleFactor),
              Text('$footer', textScaleFactor: 1),
            ],
          ),
        ),
        decoration: BoxDecoration( //                    <-- BoxDecoration
          border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}
