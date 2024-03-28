import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/random_photo.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/entity/result.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/repository/photo_repository.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/usecase/usecase.dart';

class GetPhotoUseCase implements UseCase<Result<List<RandomPhoto>>, void> {
  final PhotoRepository _photoRepository;

  GetPhotoUseCase({required PhotoRepository photoRepository})
      : _photoRepository = photoRepository;

  @override
  Future<Result<List<RandomPhoto>>> call(void params) async {
    var result = await _photoRepository.getRandomPhoto();

    if (result is Success) {
      return switch (result) {
        Success(value: final data) => Result.success(data),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return Result.failed(result.errorMessage ?? 'Err!');
    }
  }
}
