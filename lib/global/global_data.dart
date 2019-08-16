class GlobalData {
  static final globalDataInstance = new GlobalData.makeInstance();
  
  GlobalData.makeInstance();

  factory GlobalData() {
    return globalDataInstance;
  }

  var _favoritesIsNeedUpdateStatus = false;

  bool getFavoritesIsNeedUpdateStatus() => _favoritesIsNeedUpdateStatus;

  void setFavoritesIsNeedUpdateStatus(bool newStatus) {
    _favoritesIsNeedUpdateStatus = newStatus;
  }
}