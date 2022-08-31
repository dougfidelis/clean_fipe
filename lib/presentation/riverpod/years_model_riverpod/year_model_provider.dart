import 'package:clean_fipe/domain/entities/year_model_entity.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/remote/get_years_by_model_remote_datasource_imp.dart';
import '../../../data/repositories/get_years_by_model_repository_imp.dart';
import '../../../domain/usecases/get_years_by_model_usecase.dart';
import 'years_model_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final codeYearProvider = StateProvider<String>(
  (ref) => '',
);

final yearModelDatasource = Provider((ref) {
  return GetYearsByModelRemoteDatasourceImp(ref.watch(dioProvider));
});

final yearModelRepository = Provider((ref) {
  return GetYearsByModelRepositoryImp(ref.watch(yearModelDatasource));
});

final yearModelUsecase = Provider((ref) {
  return GetYearsByModelUsecaseImp(ref.watch(yearModelRepository));
});

final yearModelNotifierProvider =
    StateNotifierProvider<YearsModelNotifier, List<YearModelEntity>>((ref) {
  return YearsModelNotifier(ref.watch(yearModelUsecase));
});
