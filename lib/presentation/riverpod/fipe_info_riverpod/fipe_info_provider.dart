import 'package:clean_fipe/domain/entities/fipe_info_entity.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/remote/get_fipe_info_remote_datasource_imp.dart';
import '../../../data/repositories/get_fipe_info_repository_imp.dart';
import '../../../domain/usecases/get_fipe_info_usecase.dart';
import 'fipe_info_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final fipeInfoDatasource = Provider((ref) {
  return GetFipeInfoRemoteDatasourceImp(ref.watch(dioProvider));
});

final fipeInfoRepository = Provider((ref) {
  return GetFipeInfoRepositoryImp(ref.watch(fipeInfoDatasource));
});

final fipeInfoUsecase = Provider((ref) {
  return GetFipeInfoUsecaseImp(ref.watch(fipeInfoRepository));
});

final fipeInfoNotifierProvider =
    StateNotifierProvider<FipeInfoNotifier, FipeInfoEntity?>((ref) {
  return FipeInfoNotifier(ref.watch(fipeInfoUsecase));
});
