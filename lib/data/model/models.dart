class PhotosResponse {
  final List<PhotoModel> photos;

  PhotosResponse({this.photos});

  factory PhotosResponse.fromJson(Map<String, dynamic> json) {
    var photos = json['photos'] as List;
    List<PhotoModel> phototsList = photos.map((i) => PhotoModel.fromJson(i)).toList();
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

  PhotoModel({this.id, this.sol, this.imageUrl, this.earthDate, this.camera});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      sol: json['sol'],
      imageUrl: json['img_src'],
      earthDate: json['earth_date'],
      camera: CameraModel.fromJson(json['camera']).cameraName
    );
  }
}

class CameraModel {
  final String cameraName;

  CameraModel({this.cameraName});

  factory CameraModel.fromJson(Map<String, dynamic> json) {
    return CameraModel(cameraName: json['full_name']);
  }

}