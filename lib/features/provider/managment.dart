import 'package:flutter/widgets.dart';
import 'package:trip_tracking/features/model/city_model.dart';

class Managment with ChangeNotifier {
  String _textFieldData = "";
  List<CityModel> _selectedCityModelList = [];
  bool _isSelectedCityName = false;
  TextEditingController controller = TextEditingController(text: "");
  DateTime _date = DateTime(2023, 10, 24);
  bool _isHomePage = false;

  int get dataSize => _textFieldData.length;
  List<CityModel> get selectedCityModelList => _selectedCityModelList;
  bool get isSelectedCity => _isSelectedCityName;
  DateTime get date => _date;

  void onChanged(String value) {
    _textFieldData = value;
    if (_isSelectedCityName) {
      _isSelectedCityName = false;
    }
    notifyListeners();
  }

  selectCity(String cityName) {
    _textFieldData = "";
    if (!_isHomePage) {
      print("sorguya girdi $_isHomePage");
      _selectedCityModelList = [];
    }
    _selectedCityModelList.add(CityModel(city: cityName, numOfDay: 1));
    _isSelectedCityName = true;
    if (!_isHomePage) {
      controller.text = cityName;
    } else {
      controller.clear();
    }
    notifyListeners();
  }

  changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  goToHomePage() {
    _isHomePage = true;
    controller.clear();
  }

  changeCityDayPlus(int index) {
    int numOfDay = _selectedCityModelList[index].numOfDay ?? 1;
    _selectedCityModelList[index].numOfDay = numOfDay + 1;
    notifyListeners();
  }

  changeCityDayDecrease(int index) {
    int numOfDay = _selectedCityModelList[index].numOfDay ?? 1;
    if (numOfDay == 1) {
      _selectedCityModelList.removeAt(index);
    } else {
      _selectedCityModelList[index].numOfDay = numOfDay - 1;
    }
    notifyListeners();
  }
}
