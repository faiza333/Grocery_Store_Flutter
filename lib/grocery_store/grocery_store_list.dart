import 'package:flutter/material.dart';
import 'package:grocerystore/grocery_store/grocery_provider.dart';
import 'package:grocerystore/grocery_store/grocery_store_detailes.dart';
import 'package:grocerystore/grocery_store/staggereddualview.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;
    return Container(
        child: StaggeredDualView(
          offsetprecent: 0.5,
      aspictRatio: 0.7,
      itemBuilder: (context, index) {
        final product = bloc.catalog[index];
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 900),
                pageBuilder:(context, animation, _){
                  return FadeTransition(
                    opacity: animation,
                    child: GroceryStoreDetail(
                      product: product,
                      onProductAdded: (){
                        bloc.addProduct(product);
                      },
                    ));
            }));
          },
            child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
               mainAxisSize:MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                        tag: 'list_${product.name}',
                       child: Image.asset(
                        product.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  Text(
                    product.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  Text(
                    product.weight,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemcount: bloc.catalog.length,
    ));
  }
}



// ListView.builder(
//       padding: const EdgeInsets.only(top: cartBarHieght),
//       itemCount: bloc.catalog.length,
//       itemBuilder: (context, index){
//         return Container(
//           height: 100,
//           width: 100,
//           color: Colors.primaries[index % Colors.primaries.length],
//         );

//     });
