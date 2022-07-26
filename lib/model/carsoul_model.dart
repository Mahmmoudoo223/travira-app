
class CarsoulModel {

  String img1, img2,img3,img4,img5,img6;
  CarsoulModel({this.img1,this.img2,this.img3,this.img4,img5,img6});

  CarsoulModel.fromJson(Map<dynamic,dynamic>map){

    if(map ==null) {
      return;
    }


    img1=map['img1'];
    img2=map['img2'];
    img3=map["img3"];
    img4=map["img4"];
    img5=map["img5"];
    img6=map["img6"];

  }


  toJson(){
    return {
      'img1':img1,
      'img2':img2,
      'img3':img3,
      'img4':img4,
       'img5':img5,
       'img6':img6,
    };
  }


}
