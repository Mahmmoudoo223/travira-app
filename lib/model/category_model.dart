


class CategoryModel {

  String name, image,des,link,video,city;
  int price;
  num star;
  CategoryModel({this.name,this.image,this.des,this.link,this.video,this.city,this.price});

  CategoryModel.fromJson(Map<dynamic,dynamic>map){

    if(map ==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    star=map['star'];
    price=map['price'];
    link=map["link"];
    des=map["des"];
    video=map["video"];
    city=map["city"];
  }

  toJson(){
    return {
      'name':name,
      'image':image,
      'link':link,
      'des':des,
      'star':star,
      'price':price,
      'video':video,
      'city':city
    };
  }
}
