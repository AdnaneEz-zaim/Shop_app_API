class CategoriesModel{
  late bool status;
  late CategoriesData data;
  CategoriesModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    data=CategoriesData.fromJson(json['data']);
  }
}

class CategoriesData {
    late List<DataMod> dataModel=[];
  CategoriesData.fromJson(Map<String,dynamic> json){
    json['data'].forEach((element) {
      dataModel.add(DataMod.fromJson(element));
    });
  }
}

class DataMod {
  late int id;
  late String name;
  late String image;
  DataMod.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}