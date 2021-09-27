class FavoritesModel {
  late bool status;
  late String message;
  late Data data;

  FavoritesModel({required this.status, required this.message, required this.data});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['message'] = this.message;
  //   if (this.data != null) {
  //     data['data'] = this.data.toJson();
  //   }
  //   return data;
  // }
}

class Data {
  late int currentPage;
  late List<DataFavorite> data=[];
  late String firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;
  late dynamic nextPageUrl;
  late String path;
  late int perPage;
  late dynamic prevPageUrl;
  late int to;
  late int total;

  Data(
      {required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        this.nextPageUrl,
        required this.path,
        required this.perPage,
        this.prevPageUrl,
        required this.to,
        required this.total
      }
        );

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new DataFavorite.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['current_page'] = this.currentPage;
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   data['first_page_url'] = this.firstPageUrl;
  //   data['from'] = this.from;
  //   data['last_page'] = this.lastPage;
  //   data['last_page_url'] = this.lastPageUrl;
  //   data['next_page_url'] = this.nextPageUrl;
  //   data['path'] = this.path;
  //   data['per_page'] = this.perPage;
  //   data['prev_page_url'] = this.prevPageUrl;
  //   data['to'] = this.to;
  //   data['total'] = this.total;
  //   return data;
  // }
}

class DataFavorite {
  late int id;
  late ProductFavorite product;

  // Data({this.id, this.product});

  DataFavorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    (json['product'] != null ? new ProductFavorite.fromJson(json['product']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class ProductFavorite {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late dynamic discount;
  late String image;
  late String name;
  late String description;

  ProductFavorite(
      {required this.id,
        required this.price,
        required this.oldPrice,
        required this.discount,
        required this.image,
        required this.name,
        required this.description});

  ProductFavorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}