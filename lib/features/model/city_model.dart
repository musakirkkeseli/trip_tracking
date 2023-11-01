class CityModel {
  int? id;
  String? city;
  int? numOfDay;

  CityModel({this.id, this.city, this.numOfDay});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    numOfDay = json['numOfDay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['city'] = city;
    data['numOfDay'] = numOfDay;
    return data;
  }
}
