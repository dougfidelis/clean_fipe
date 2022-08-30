import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/remote/get_years_by_brand_remote_datasource_imp.dart';
import '../../../data/repositories/get_years_by_brand_repository_imp.dart';
import '../../../domain/entities/year_model_entity.dart';
import '../../../domain/usecases/get_years_by_brand_usecase.dart';
import 'years_brand_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final yearBrandDatasource = Provider((ref) {
  return GetYearsByBrandRemoteDatasourceImp(ref.watch(dioProvider));
});

final yearBrandRepository = Provider((ref) {
  return GetYearsByBrandRepositoryImp(ref.watch(yearBrandDatasource));
});

final yearBrandUsecase = Provider((ref) {
  return GetYearsByBrandUsecaseImp(ref.watch(yearBrandRepository));
});

final yearBrandNotifierProvider =
    StateNotifierProvider<YearsBrandNotifier, List<YearModelEntity>>((ref) {
  return YearsBrandNotifier(ref.watch(yearBrandUsecase));
});
