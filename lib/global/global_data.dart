class GlobalData {
  static final globalDataInstance = new GlobalData.makeInstance();
  
  GlobalData.makeInstance();

  List<String> _availableYears = [];

  factory GlobalData() {
    return globalDataInstance;
  }

  var _favoritesIsNeedUpdateStatus = false;

  bool getFavoritesIsNeedUpdateStatus() => _favoritesIsNeedUpdateStatus;

  void setFavoritesIsNeedUpdateStatus(bool newStatus) {
    _favoritesIsNeedUpdateStatus = newStatus;
  }

  void setAvailableYears(List<String> years) {
    _availableYears = years;
  }

  List<String> getAvailableYears() => _availableYears;
}