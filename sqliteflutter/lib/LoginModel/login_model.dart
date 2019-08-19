class LoginModel {
 String name ;
 String sex;
 int age;
 int weight;
 int height;
   static LoginModel fromMap(Map<String, dynamic> map) {
    LoginModel model = new LoginModel();
    model.name = map['name'];
    model.sex = map['sex'];
    model.age = map['age'];
    return model;
  }

  static List<LoginModel> fromMapList(dynamic mapList) {
    List<LoginModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }


}