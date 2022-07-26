





class EmployeeModel {

  String name,code;
  num coins ;


  EmployeeModel({this.name,this.code,this.coins});

  EmployeeModel.fromJson(Map<dynamic,dynamic>map){

    if(map ==null){
      return;
    }
    name=map['name'];
    code=map['code'];
    coins=map['coins'];
  }

  toJson(){
    return {
      'name':name,
      'code':code,
      'coins':coins,
    };
  }
}
