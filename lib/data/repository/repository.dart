import 'package:our_mars/data/api/nasa_api.dart';
import 'package:our_mars/data/db/database.dart';
import 'package:our_mars/data/model/models.dart';
import 'package:our_mars/screens/screen_main/widgets_main.dart';

abstract class Repository {
  Future<void> addFavoritePhoto(PhotoModel photo);
  Future<void> removeFavoritePhoto(PhotoModel photo);
  Future<List<PhotoModel>> getFavoritePhotos();
  Future<List<PhotoModel>> getRoverPhotos(String date, RoverType roverType);
}

class RoversPhotoRepository extends Repository {
  final DBProvider dbProvider;
  final NasaApi api;

  static final repositoryInstance = new RoversPhotoRepository.makeInstance(DBProvider.db, NasaApi());
  
  RoversPhotoRepository.makeInstance(this.dbProvider, this.api);

  factory RoversPhotoRepository() {
    return repositoryInstance;
  }

  @override
  Future<void> addFavoritePhoto(PhotoModel photo) {
    return dbProvider.insertPhotoModel(photo);
  }

  @override
  Future<void> removeFavoritePhoto(PhotoModel photo) {
    return dbProvider.deletePhotoById(photo.id);
  }

  @override
  Future<List<PhotoModel>> getFavoritePhotos() {
    return dbProvider.getAllPhotos();
  }

  @override
  Future<List<PhotoModel>> getRoverPhotos(String date, RoverType roverType) {
    return api.getPhotos(date, roverType);
  }
  
}