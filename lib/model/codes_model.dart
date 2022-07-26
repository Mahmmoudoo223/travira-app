



 class CodesModel {

  List<dynamic>codes;
  String name;

  CodesModel({this.codes,this.name});

  CodesModel.fromJson(Map<dynamic,dynamic>map){

    if(map ==null){
      return;
    }
    codes=map['code'];
    name=map['name'];
  }

  toJson(){
    return {
      'code':codes,
      'name':name,
    };
  }

}
