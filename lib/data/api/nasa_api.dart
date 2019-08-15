import 'dart:convert';
import 'package:our_mars/data/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:our_mars/screens/screen_main/widgets_main.dart';


class NasaApi {
  final api_endpoint = "https://api.nasa.gov/mars-photos/api/v1/rovers";
  
  final api_path_rover_curiosity = "curiosity";
  final api_path_rover_opportunity = "opportunity";
  final api_path_rover_spirit = "spirit";
  final api_path_photos = "photos";

  final api_param_key = "api_key";
  final api_param_earth_date = "earth_date";
  final api_param_page = "page";

  final nasa_api_key = "K3HSuWeGPWudvgynhcmu6BLm1dy4aOoDCdaysa6M";

  static final apiInstance = new NasaApi.makeInstance();

  static final mockModels = [
    PhotoModel(
      sol: 100,
      imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg',
      earthDate: '21-12-2018',
      camera:  "NASD",
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://boygeniusreport.files.wordpress.com/2017/05/mars1.jpg?quality=98&strip=all&w=782',
      earthDate: '21-12-2018',
      camera: "NASD",
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://thenypost.files.wordpress.com/2019/03/mars-pebbles.jpg?quality=90&strip=all&w=618&h=410&crop=1',
      earthDate: '21-12-2018',
      camera: "NASD",
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://www.geek.com/wp-content/uploads/2019/04/curiosity-1-625x352.jpg',
      earthDate: '21-12-2018',
      camera: "NASD",
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVIYGyyRdAGJ5N5WISIeinevCUezLB9MwJCE01hmh5ZJBls9ZM',
      earthDate: '21-12-2018',
      camera: "NASD",
    ),
    PhotoModel(
      sol: 100,
      imageUrl: 'https://mk0astronomynow9oh6g.kinstacdn.com/wp-content/uploads/2017/09/pia21850-1785MR009211_sitesphericalmosaic_noscale-full.jpg',
      earthDate: '21-12-2018',
      camera: "NASD",
    ),    
  ];

  NasaApi.makeInstance();

  factory NasaApi() {
    return apiInstance;
  }

  Future<List<PhotoModel>> getPhotosTest() async {
    var reqBuilder = RequestBuilder();
    reqBuilder.setUrl(api_endpoint)
              .addPath(api_path_rover_curiosity)
              .addPath(api_path_photos)
              .addParam(api_param_page, "1")
              .addParam(api_param_earth_date, "2018-12-20")
              .addParam(api_param_key, nasa_api_key);
    print(reqBuilder.buildRequestUrl());
    final resp = await http.get(reqBuilder.buildRequestUrl());
    if (resp.statusCode == 200) {
      var photos = PhotosResponse.fromJson(json.decode(resp.body)).photos;
      photos.forEach((photo) {
        photo.roverType = RoverType.Curiosity.toString().split(".")[1];
      });
      return photos;
    } else {
      throw Exception('Failed to load photo');
    }
  } 

  Future<List<PhotoModel>> getPhotos(String date, RoverType roverType) async {
    var reqBuilder = RequestBuilder();
    reqBuilder.setUrl(api_endpoint);
    switch (roverType) {
      case RoverType.Curiosity:
        reqBuilder.addPath(api_path_rover_curiosity);
        break;
      case RoverType.Opportunity:
        reqBuilder.addPath(api_path_rover_opportunity);
        break;
      case RoverType.Sprit:
        reqBuilder.addPath(api_path_rover_spirit);
        break; 
    }
    reqBuilder.addPath(api_path_photos)
              .addParam(api_param_page, "1")
              .addParam(api_param_earth_date, date)
              .addParam(api_param_key, nasa_api_key);
    print(reqBuilder.buildRequestUrl());
    final resp = await http.get(reqBuilder.buildRequestUrl());
    if (resp.statusCode == 200) {
      var photos = PhotosResponse.fromJson(json.decode(resp.body)).photos;
      photos.forEach((photo) {
        photo.roverType = roverType.toString().split(".")[1];
      });
      return photos;
    } else {
      throw Exception('Failed to load photo');
    }
  }
}

class RequestBuilder {

  String baseUrl;
  List<String> requestParams = [];
  List<String> requestPath = [];

  RequestBuilder setUrl(String url) {
    this.baseUrl = url;
    return this;
  }

  RequestBuilder addPath(String path) {
    this.requestPath.add("/"+path);
    return this;
  }

  RequestBuilder addParam(String key, String value) {
    this.requestParams.add(key+"="+value);
    return this;
  }

  String buildRequestUrl() {
    var requestPathString = "";
    this.requestPath.forEach((path) {requestPathString += path;});
    var requestParamsString = "";
    var index = 0;
    for (final param in this.requestParams) {
      if (index == 0) {
        requestParamsString += "?" + param;
      } else {
        requestParamsString += "&" + param;
      }
      index++;
    }
    return this.baseUrl+requestPathString+requestParamsString; 
  }

}