
import 'dart:async';

import 'package:our_mars/data/api/nasa_api.dart';
import 'package:our_mars/data/model/models.dart';

class MainScreenBlock {
  final streamController = StreamController<PhotoGridState>();

  Stream<PhotoGridState> get photoGridState => streamController.stream;

  void loadPhotos() {
    streamController.sink.add(PhotoGridState.loading());
    NasaApi().getPhotosTest()
             .then((photos) {
               streamController.sink.add(PhotoGridState.data(photos));
            });
  }

  void dispose() {
    streamController.close();
  }
}

class PhotoGridState {
  PhotoGridState();
  
  factory PhotoGridState.initial() = PhotoGridInitialState;
  factory PhotoGridState.loading() = PhotoGridLoadingState;
  factory PhotoGridState.error() = PhotoGridErrorState;
  factory PhotoGridState.data(List<PhotoModel> photos) = PhotoGridDataState;
}

class PhotoGridInitialState extends PhotoGridState {}

class PhotoGridLoadingState extends PhotoGridState {}

class PhotoGridErrorState extends PhotoGridState {}

class PhotoGridDataState extends PhotoGridState {
  final List<PhotoModel> photos;
  PhotoGridDataState(this.photos);
}