
import 'package:flutter/cupertino.dart';
import 'package:grocerystore/grocery_store/grocery_product.dart';

enum GroceryState{
  normal,
  details,
  cart,
}
 
 class GroceryStoreBloc extends ChangeNotifier{
   
    GroceryState groceryState = GroceryState.normal;
    List<GroceryProduct> catalog = List.unmodifiable(groceryproduct);
    List<GroceryProductItem> cart = [];

    void changeToNormal()
    {
      groceryState = GroceryState.normal;
      notifyListeners();
    }

        void changeToCart()
    {
      groceryState = GroceryState.cart;
      notifyListeners();
    }
    void deleteProduct(GroceryProductItem productItem)
    {
      cart.remove(productItem);
      notifyListeners();
    }

    void addProduct(GroceryProduct product){

      for(GroceryProductItem item in cart){
        if(item.product.name == product.name)
        {
          item.increment();
          notifyListeners();
          return;
        }
      }
      cart.add(GroceryProductItem(product: product));
      notifyListeners();
    }
    int totalCartElement () => cart.fold<int>(0,
     (previousValue, element) => previousValue + element.quantity);

     
    double totalPriceElement () => cart.fold<double>(0.0,
     (previousValue, element) => previousValue + (element.quantity*element.product.price));
 }
class GroceryProductItem {
      int quantity;
      final GroceryProduct product;

  GroceryProductItem({@required this.product, this.quantity = 1});

  void increment(){
    quantity++;
  }

  void decrement(){}
}