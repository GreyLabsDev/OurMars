
import 'dart:async';

import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/data/repository/repository.dart';
import 'package:our_mars/global/global_data.dart';
import 'package:our_mars/screens/screen_main/widgets_main.dart';

class BlocRoverPhotos {
  final Repository repository;
  final StreamController streamController = StreamController<BlocRoverPhotosState>();

  Stream<BlocRoverPhotosState> get roverPhotosState => streamController.stream;

  BlocRoverPhotos(this.repository);

  var _dateYear = DateTime.now().year;
  var _dateMonth = DateTime.now().month;
  var _dateDay = 1;
  var _roverType = RoverType.Curiosity;

  String _generateRequestDateString() => "$_dateYear-$_dateMonth-$_dateDay";  

  void dispose() {
    streamController.close();
  }

  void setDateYear(int year) {
    _dateYear = year;
    getRoverPhotos();
  }

  void setDateMonth(int month) {
    _dateMonth = month;
    getRoverPhotos();
  }

  void setRoverType(RoverType type) {
    _roverType = type;
    getRoverPhotos();
  }

  void getFavoritePhotos() {
    streamController.sink.add(BlocRoverPhotosState.loading());
    repository.getFavoritePhotos()
    .catchError((error) {
      streamController.sink.add(BlocRoverPhotosState.error(error.toString()));
    })
    .then((photos) {
      streamController.sink.add(BlocRoverPhotosState.data(photos));
    });
  }

  void addOrRemoveFavoritePhoto(bool isFavorite, PhotoModel photo) {
    if (isFavorite) {
      addFavoritePhoto(photo);
    } else removeFavoritePhoto(photo);
    
  }

  void addFavoritePhoto(PhotoModel photo) {
    photo.isFavorite = 1;
    repository.addFavoritePhoto(photo);
  }

  void removeFavoritePhoto(PhotoModel photo) {
    repository.removeFavoritePhoto(photo);
  }

  void removeFavoritePhotoAndReload(PhotoModel photo) {
    repository.removeFavoritePhoto(photo)
    .whenComplete((){
      getFavoritePhotos();
    });
    GlobalData().setFavoritesIsNeedUpdateStatus(true);
  }

  void getRoverPhotos() {
    streamController.sink.add(BlocRoverPhotosState.loading());
    repository.getRoverPhotos(_generateRequestDateString(), _roverType)
    .catchError((error) {
      streamController.sink.add(BlocRoverPhotosState.error(error.toString()));
    })
    .then((photos) {
      streamController.sink.add(BlocRoverPhotosState.data(photos));
    });
  }

}

class BlocRoverPhotosState {
  BlocRoverPhotosState();

  factory BlocRoverPhotosState.error(String errorMessage) => BlocRoverPhotosStateError(errorMessage);
  factory BlocRoverPhotosState.intial() => BlocRoverPhotosStateInitial();
  factory BlocRoverPhotosState.loading() => BlocRoverPhotosStateLoading();
  factory BlocRoverPhotosState.data(List<PhotoModel> photos) => BlocRoverPhotosStateData(photos);
}

class BlocRoverPhotosStateError extends BlocRoverPhotosState {
  final String errorMessage;
  BlocRoverPhotosStateError(this.errorMessage);
}

class BlocRoverPhotosStateInitial extends BlocRoverPhotosState  {}

class BlocRoverPhotosStateLoading extends BlocRoverPhotosState  {}

class BlocRoverPhotosStateData extends BlocRoverPhotosState  {
  final List<PhotoModel> photos;
  BlocRoverPhotosStateData(this.photos);
}
