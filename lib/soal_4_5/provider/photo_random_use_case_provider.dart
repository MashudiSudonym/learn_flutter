import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/provider/photo_repository_provider.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/usecase/get_photo_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_random_use_case_provider.g.dart';

@riverpod
GetPhotoUseCase getPhotoRandomUseCase(GetPhotoRandomUseCaseRef ref) =>
    GetPhotoUseCase(
      photoRepository: ref.watch(photoRepositoryProvider),
    );
