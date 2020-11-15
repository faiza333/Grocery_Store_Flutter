import 'package:flutter/cupertino.dart';
import 'package:grocerystore/grocery_store/grocery_store_block.dart';

class GroceryProvider extends InheritedWidget{
  final GroceryStoreBloc bloc;
  final Widget child;

GroceryProvider({@required this.bloc, @required this.child});

static GroceryProvider of(BuildContext context) =>
 context.dependOnInheritedWidgetOfExactType<GroceryProvider>();
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    throw UnimplementedError();
  }
}