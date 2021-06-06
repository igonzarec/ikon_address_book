import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikon_address_book/constants/constants.dart';

class GroupView extends StatefulWidget {
  GroupView(this._contactNames, {Key key, this.title}) : super(key: key);

  final List<String> _contactNames;
  final String title;

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  bool _isSearchActive = false;
  Iterable<String> _suggestions;
  String hintText = 'Type in here to search and filter';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            collapsedHeight: 100,
            expandedHeight: 200,

            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Address book'),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 30
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        height: 30,
                        child: FocusScope(
                          onFocusChange: (value) {
                            if (value == true) {
                              setState(() {
                                hintText = "";
                              });
                            }
                          },
                          child: TextField(
                            cursorHeight: 18,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 30,
                            decoration: InputDecoration(
                              hintText: hintText,
                              labelStyle: TextStyle(),
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                              contentPadding: EdgeInsets.all(5),
                              counterText: "",
                            ),
                            onTap: () {},
                            onChanged: (input) {
                              if (input.isNotEmpty) {
                                setState(() {
                                  _isSearchActive = true;
                                });
                              }
                              setState(
                                () {
                                  _suggestions = widget._contactNames.where(
                                    (contactName) {
                                      return contactName
                                          .toLowerCase()
                                          .contains(input.toLowerCase());
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
          !_isSearchActive
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        //TODO: add proper format to this
                        color: index.isOdd ? Colors.white : Colors.black12,
                        height: 100.0,
                        child: Center(
                          child: Text('${widget._contactNames[index]}',
                              textScaleFactor:
                                  Constants.contactNameScaleFactor),
                        ),
                      );
                    },
                    childCount: widget._contactNames.length,
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        //TODO: add proper format to this
                        color: index.isOdd ? Colors.white : Colors.black12,
                        height: 100.0,
                        child: Center(
                          child: Text('${_suggestions.elementAt(index)}',
                              textScaleFactor:
                                  Constants.contactNameScaleFactor),
                        ),
                      );
                    },
                    childCount: _suggestions.length,
                  ),
                ),
        ],
      ),
    );
  }
}
