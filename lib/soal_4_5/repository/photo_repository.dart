import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/random_photo.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<RandomPhoto>>> getRandomPhoto();
}
