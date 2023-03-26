// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';
import 'package:shemsu_suk/model/item.dart';


class Cart extends Equatable{
  final List<item> products;

  Map productsQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if(!quantity.containsKey(product)) {
        quantity[product] = 1;
      }
      else {quantity[product] += 1;}
    });
    return quantity;
  }

  const Cart({this.products = const <item>[]});

  double get subtotal => products.fold(0, (total, current) => total + current.price);
  String get subtotalString => subtotal.toStringAsFixed(2);
  
 
  String get totalString => total(subtotal).toStringAsFixed(2);
  double total(subtotal) {
    return subtotal ;
  }
  

  @override
  List<Object?> get props => [products];

}