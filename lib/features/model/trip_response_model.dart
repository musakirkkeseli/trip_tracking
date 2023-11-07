class TripResponseModel {
  List<Cities>? cities;

  TripResponseModel({this.cities});

  TripResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cities != null) {
      data['cities'] = cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? cityName;
  List<Weathers>? weathers;
  List<Hotels>? hotels;

  Cities({this.cityName, this.weathers, this.hotels});

  Cities.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    if (json['weathers'] != null) {
      weathers = <Weathers>[];
      json['weathers'].forEach((v) {
        weathers!.add(Weathers.fromJson(v));
      });
    }
    if (json['hotels'] != null) {
      hotels = <Hotels>[];
      json['hotels'].forEach((v) {
        hotels!.add(Hotels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityName'] = cityName;
    if (weathers != null) {
      data['weathers'] = weathers!.map((v) => v.toJson()).toList();
    }
    if (hotels != null) {
      data['hotels'] = hotels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weathers {
  String? date;
  int? weatherType;
  int? degree;

  Weathers({this.date, this.weatherType, this.degree});

  Weathers.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    weatherType = json['weatherType'];
    degree = json['degree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['weatherType'] = weatherType;
    data['degree'] = degree;
    return data;
  }
}

class Hotels {
  String? hotelName;
  String? image;

  Hotels({this.hotelName, this.image});

  Hotels.fromJson(Map<String, dynamic> json) {
    hotelName = json['hotelName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotelName'] = hotelName;
    data['image'] = image;
    return data;
  }
}
