class GlobalData {
  static final globalDataInstance = new GlobalData.makeInstance();
  
  GlobalData.makeInstance();

  List<String> _availableYears = [];

  factory GlobalData() {
    return globalDataInstance;
  }

  var _favoritesIsNeedUpdateStatus = false;
  var _selectedYear = "2019";

  bool getFavoritesIsNeedUpdateStatus() => _favoritesIsNeedUpdateStatus;

  void setFavoritesIsNeedUpdateStatus(bool newStatus) {
    _favoritesIsNeedUpdateStatus = newStatus;
  }

  void setAvailableYears(List<String> years) {
    _availableYears = years;
  }

  void setSelectedYear(String year) {
    _selectedYear = year;
  }

  String getSelectedYear() => _selectedYear;

  List<String> getAvailableYears() => _availableYears;
}