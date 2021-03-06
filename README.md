# ikon_address_book

This project seeks to present a solution to the challenge received by ikon technologies. It is an application that can manipulate a list and render it in an address book by fulfilling certain functionality. It was kept in mind to structure the code so that the classes were in different packages according to their functions. This is how the packages of constants, models, screens, services and widgets were defined. This was done with the idea of ​​ensuring an order in case one wanted to scale the application. Speaking specifically about the definition of widgets, the components were separated into methods and widgets as seemed necessary. The application consists of showing the GroupView widget, where a list of contacts is rendered with which the user can interact (the contact names are tappable elements) by applying filters or navigating to the contact details. It uses a CustomScrollView and slivers. 

The main widget class accepts generic values ​​that extend from NamedElement, in this way the data it receives can be handled without any extra operation. The given elements just have to extend from the abstract class NamedElement to be able to call getName (). In the GroupView class it is also possible to add optional headers and footers that are drawn in case of being set.

Since the application works with a list, it could be a possibility to implement a "scroll to index", but it should be taken into account that, when working with a widget that shows a scrollable list, the most direct solution is to use a ListView and its controller. CustomScrollView also has a controller but it seems to handle the whole and not just the SliverList, which does not have a controller like ListView. In that sense, if you one wants to keep the Slivers, an approach can be to make use of a package https://pub.dev/packages/scroll_to_index or to manipulate the widgets at a lower level, which is not as straightforward, as is known .

Finally, regarding the search engine that works as a filter, I chose to design it myself using an algorithm, two lists and the properties of the TextField. All within a Stateful Widget.

To test this solution it is enough to access the project, run flutter pub get and then compile it either on an emulator or on a physical Android or iOS device. Preferably with Android Studio or Visual Studio Code.

It is worth mentioning that this project was carried out on a computer with flutter version 2.0.5.
