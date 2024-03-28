import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/random_photo.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'json_service.g.dart';

@RestApi()
abstract class JsonService {
  factory JsonService(Dio dio) = _JsonService;

  @GET('/albums/1/photos')
  Future<List<RandomPhoto>> getRandomPhoto();
}
