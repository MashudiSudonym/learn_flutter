import 'dart:developer';

import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/random_photo.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/result.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/helper/network_client_helper.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/repository/photo_repository.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/service/json_service.dart';
import 'package:dio/dio.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final JsonService _jsonService;

  PhotoRepositoryImpl({JsonService? jsonService})
      : _jsonService = jsonService ??
            JsonService(
              NetworkClientHelper.instance.client,
            );

  @override
  Future<Result<List<RandomPhoto>>> getRandomPhoto() async {
    try {
      var result = await _jsonService.getRandomPhoto();

      log(result.toString(), name: 'get data');

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.message ?? 'Err!');
    }
  }
}
