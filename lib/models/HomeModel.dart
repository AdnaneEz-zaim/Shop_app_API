class HomeModel{
 late bool status;
 late DataModel data;
 HomeModel.fromJson(Map<String,dynamic> json){
    status=json['status'];
    json['data']!=null ?data=DataModel.fromJson(json['data']):null;
 }
}

class DataModel{
  late List<Banner> banners=[];
  late List<Product> products=[];

  DataModel.fromJson(Map<String,dynamic> json){
    json['banners'].forEach((element) {
      banners.add(Banner.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(Product.fromJson(element));
    });
  }
}

class Banner{
  late int id;
  late String image;

  Banner.fromJson(Map<String,dynamic> json){
    id=json['id'];
    image=json['image'];
  }
}
class Product{
  late int id;
  late dynamic price;
  late dynamic old_price;
  late dynamic discount;
  late String image;
  late String name;
  late String description;
  late List<String> images=[];
  late bool in_favorites;
  late bool in_cart;

  Product.fromJson(Map<String,dynamic> json){
     id=json['id'];
     price=json['price'];
     old_price=json['old_price'];
     discount=json['old_price'];
     image=json['image'];
     name=json['name'];
     description=json['description'];
     json['images'].forEach((element) {
       images.add(element);
     });
     in_favorites=json['in_favorites'];
     in_cart=json['in_cart'];
  }
}