import 'dart:io';
import 'dart:convert';
import 'package:our_mars/data/model/models.dart';
import 'package:http/http.dart' as http;


class NasaApi {
  final api_endpoint = "https://api.nasa.gov/mars-photos/api/v1/rovers";
  
  final api_path_rover_curiosity = "/curiosity";
  final api_path_rover_opportunity = "/opportunity";
  final api_path_rover_spirit = "/spirit";
  final api_path_photos = "/photos";

  final api_param_key = "api_key=";

  final nasa_api_key = "K3HSuWeGPWudvgynhcmu6BLm1dy4aOoDCdaysa6M";

  static final apiInstance = new NasaApi.makeInstance();

  static final mockModels = [
    PhotoModel(
      sol: 100,
      imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg',
      earthDate: '21-12-2018',
      camera: new CameraModel(cameraName: "NASD"),
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://boygeniusreport.files.wordpress.com/2017/05/mars1.jpg?quality=98&strip=all&w=782',
      earthDate: '21-12-2018',
      camera: new CameraModel(cameraName: "NASD"),
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://thenypost.files.wordpress.com/2019/03/mars-pebbles.jpg?quality=90&strip=all&w=618&h=410&crop=1',
      earthDate: '21-12-2018',
      camera: new CameraModel(cameraName: "NASD"),
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://www.geek.com/wp-content/uploads/2019/04/curiosity-1-625x352.jpg',
      earthDate: '21-12-2018',
      camera: new CameraModel(cameraName: "NASD"),
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIYGyyRdAGJ5N5WISIeinevCUezLB9MwJCE01hmh5ZJBls9ZM',
      earthDate: '21-12-2018',
      camera: new CameraModel(cameraName: "NASD"),
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg',
      earthDate: '21-12-2018',
      camera: new CameraModel(cameraName: "NASD"),
    ),    
  ];

  NasaApi.makeInstance();

  factory NasaApi() {
    return apiInstance;
  }

  Future<List<PhotoModel>> getPhotos() async {
    final resp = await http.get(api_endpoint+api_path_rover_curiosity+api_path_photos+"?earth_date=2015-6-3&"+api_param_key+nasa_api_key);
    print(resp.body.toString());
    if (resp.statusCode == 200) {
      return PhotosResponse.fromJson(json.decode(resp.body)).photos;
    } else {
      throw Exception('Failed to load photo');
    }
  }
}