import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikon_address_book/constants/constants.dart';
import 'package:ikon_address_book/models/named_element.dart';
import 'package:ikon_address_book/widgets/contact_name_widget.dart';

class GroupView<T extends NamedElement> extends StatefulWidget {
  GroupView(this._contacts, {Key key, this.header: "", this.footer: ""})
      : super(key: key);

  final List<T> _contacts;
  final String header, footer;

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState<T extends NamedElement> extends State<GroupView> {
  bool _isSearchActive = false;
  Iterable<T> _suggestions = [];
  String hintText = 'Type in here to search and filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          buildSliverList(),
        ],
      ),
      bottomNavigationBar: widget.footer.isNotEmpty
          ? BottomAppBar(
              child: Text(
                widget.footer,
                textScaleFactor: Constants.optionalFooterScaleFactor,
                style: TextStyle(color: Colors.white, height: 2),
                textAlign: TextAlign.center,
              ),
        color: Constants.themeColor,
            )
          : null,
    );
  }

  SliverList buildSliverList() {
    return !_isSearchActive
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ContactNameWidget(
                  widget._contacts[index].getName(),
                );
              },
              childCount: widget._contacts.length,
            ),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ContactNameWidget(
                  _suggestions.elementAt(index).getName(),
                );
              },
              childCount: _suggestions.length,
            ),
          );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
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
              if(widget.header.isNotEmpty) Text(widget.header, textScaleFactor: Constants.optionalHeaderScaleFactor,),
              if(widget.header.isNotEmpty) Text("Address book", textScaleFactor: Constants.titleScaleFactor,),
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: 30),
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(style: BorderStyle.none)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(style: BorderStyle.none)),
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
                            _suggestions = widget._contacts.where(
                              (contact) {
                                return contact
                                    .getName()
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
              if (_isSearchActive &&
                  _suggestions.length != widget._contacts.length)
                Text(
                  'Search matches: ${_suggestions.length}',
                  style: TextStyle(
                    height: 0,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
