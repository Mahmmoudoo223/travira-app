
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class ProductModel {
  String productId, name, image, des, sized,brand,brand_email,x,link,city;
  int price;
  num quant,star;

  String color;

  ProductModel(
      {this.productId,
        this.name,
        this.image,
        this.des,
        this.color,
        this.star,
        this.sized,
        this.brand,
        this.city,
        this.x,
        this.link,
        this.brand_email,
        this.price,
        this.quant});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    des = map['des'];
    star=map['star'];
    color = map['color'];
    city=map['city'];
    sized = map['sized'];
    link=map['link'];
    x=map["x"];




    quant = map['quant'];
    brand = map['brand'];
    price=map['price'];
    brand_email=map['brandemail'];
    productId = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'des': des,
      'color': color,
      'sized': sized,
      'star':star,
      'city':city,
      'price': price,
      'link':link,
      'productid': productId,
      'brand':brand,
      'x':x,
      'brandemail':brand_email
    };
  }
}
