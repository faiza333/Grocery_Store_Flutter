import 'package:flutter/material.dart';
import 'package:grocerystore/grocery_store/grocery_product.dart';

class GroceryStoreDetail extends StatefulWidget {
  final GroceryProduct product;
  
  final VoidCallback onProductAdded;
  const GroceryStoreDetail(
      {Key key, this.onProductAdded, @required this.product})
      : super(key: key);

  @override
  _GroceryStoreDetailState createState() => _GroceryStoreDetailState();
}

class _GroceryStoreDetailState extends State<GroceryStoreDetail> {
  String heroTag = ''; 
  @override
  void setState(fn) {
    heroTag = 'details';
    super.setState(fn);
  }
  void _addToCart(BuildContext context) {
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                    tag: 'list_${widget.product.name}$heroTag',
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.36,
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(widget.product.name,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                SizedBox(
                  height: 15,
                ),
                Text(widget.product.weight,
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Spacer(),
                    Text('\$${widget.product.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text('About The Product',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15,
                ),
                Text(widget.product.description,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.grey,
                          fontSize: 17,
                        )),
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Color(0xFFF4C459),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Add To Card',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () {
                      _addToCart(context);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
