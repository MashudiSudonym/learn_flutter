import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/random_photo.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/result.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/provider/photo_random_use_case_provider.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/usecase/get_photo_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_photo_random_provider.g.dart';

@riverpod
Future<List<RandomPhoto>> getPhotoRandom(GetPhotoRandomRef ref) async {
  GetPhotoUseCase getPhotoUseCase = ref.read(getPhotoRandomUseCaseProvider);

  var result = await getPhotoUseCase(null);

  return switch (result) {
    Success(value: final data) => data,
    Failed(message: _) => const [],
  };
}
