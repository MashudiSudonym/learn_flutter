import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/repository/photo_repository.dart';
import 'package:apps_muhamad_mashudi_ardi_winata/soal_4_5/repository/photo_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_repository_provider.g.dart';

@riverpod
PhotoRepository photoRepository(PhotoRepositoryRef ref) => PhotoRepositoryImpl();
