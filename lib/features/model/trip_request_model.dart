import 'package:trip_tracking/features/model/city_model.dart';

class TripRequestModel {
  DateTime? startDate;
  List<CityModel>? cityModel;

  TripRequestModel({this.startDate, this.cityModel});

  TripRequestModel.fromJson(Map<String, dynamic> json) {
    startDate = json['startDate'];
    if (json['cityModel'] != null) {
      cityModel = <CityModel>[];
      json['cityModel'].forEach((v) {
        cityModel!.add(CityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startDate'] = startDate;
    if (cityModel != null) {
      data['cityModel'] = cityModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
