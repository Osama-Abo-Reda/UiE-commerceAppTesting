class CatgoriesModel {
  bool? status;
  CatgoriesDataModel? data;

  CatgoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CatgoriesDataModel.fromJson(json['data']);
  }
}

class CatgoriesDataModel {
  int? currentPage;
  List<DataModel>? data;
  CatgoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) => data!.add(DataModel.fromJson(element)));
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
