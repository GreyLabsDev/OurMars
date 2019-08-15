class PhotosResponse {
  final List<PhotoModel> photos;

  PhotosResponse({this.photos});

  factory PhotosResponse.fromJson(Map<String, dynamic> json) {
    var photos = json['photos'] as List;
    List<PhotoModel> phototsList =
        photos.map((i) => PhotoModel.fromJson(i)).toList();
    return PhotosResponse(photos: phototsList);
  }
}

class PhotoModel {
  final int id;
  final int sol;
  final String imageUrl;
  final String earthDate;
  final String camera;
  String roverType;
  int isFavorite = 0;

  PhotoModel(
      {this.id,
      this.sol,
      this.imageUrl,
      this.earthDate,
      this.camera,
      this.roverType,
      this.isFavorite});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        id: json['id'],
        sol: json['sol'],
        imageUrl: json['img_src'],
        earthDate: json['earth_date'],
        camera: CameraModel.fromJson(json['camera']).cameraName,
        roverType: "",
        isFavorite: 0);
  }

  factory PhotoModel.fromMap(Map<String, dynamic> json) => new PhotoModel(
      id: json["id"],
      sol: json['sol'],
      imageUrl: json['img_src'],
      earthDate: json['earth_date'],
      camera: json["camera"],
      roverType: json["rover_type"],
      isFavorite: json["is_favorite"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "sol": sol,
        "img_src": imageUrl,
        "earth_date": earthDate,
        "camera": camera,
        "rover_type": roverType,
        "is_favorite": isFavorite,
      };
}

class CameraModel {
  final String cameraName;

  CameraModel({this.cameraName});

  factory CameraModel.fromJson(Map<String, dynamic> json) {
    return CameraModel(cameraName: json['full_name']);
  }
}
