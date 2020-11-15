//import 'package:grocerystore/grocery_store/grocery_store_block.dart';

class GroceryProduct {
  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;

  const GroceryProduct
  (
      {
        this.description,
        this.image,
        this.name,
        this.price,
        this.weight
      }
  );
}
const groceryproduct = <GroceryProduct> [
  GroceryProduct(
    description: "This is my design for grocery app hope u like it,This is my design for grocery app hope u like it",
    price: 8.9,
    name: 'avocado',
    image: 'assets/grocery/a.jpeg',
    weight: '500g'
  ),
    GroceryProduct(
    description: "This is my design for grocery app hope u like it,This is my design for grocery app hope u like it",
    price: 8.9,
    name: 'dona',
    image: 'assets/grocery/a.jpeg',
    weight: '500g'
  ),
    GroceryProduct(
    description: "This is my design for grocery app hope u like it,This is my design for grocery app hope u like it",
    price: 8.9,
    name: 'orange',
    image: 'assets/grocery/a.jpeg',
    weight: '500g'
  ),
    GroceryProduct(
    description: "This is my design for grocery app hope u like it,This is my design for grocery app hope u like it",
    price: 8.9,
    name: 'stroberry',
    image: 'assets/grocery/a.jpeg',
    weight: '500g'
  ),
    GroceryProduct(
    description: "This is my design for grocery app hope u like it,This is my design for grocery app hope u like it",
    price: 8.0,
    name: 'apple',
    image: 'assets/grocery/a.jpeg',
    weight: '400g'
  ),
    GroceryProduct(
    description: "This is my design for grocery app hope u like it,This is my design for grocery app hope u like it",
    price: 5.3,
    name: 'Mango',
    image: 'assets/grocery/a.jpeg',
    weight: '900g'
  ),
];
