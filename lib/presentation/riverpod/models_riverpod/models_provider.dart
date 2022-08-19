import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/remote/get_models_by_brand_remote_datasource_imp.dart';
import '../../../data/repositories/get_models_by_brand_repository_imp.dart';
import '../../../domain/entities/model_entity.dart';
import '../../../domain/usecases/get_models_by_brand_usecase.dart';
import 'models_nofier.dart';

final dioProvider = Provider((ref) => Dio());

final modelsByBrandDatasource = Provider( (ref) {
    return GetModelsByBrandRemoteDatasourceImp(ref.watch(dioProvider));
  });

final modelsByBrandRepository = Provider((ref) {
    return GetModelsByBrandRepositoryImp(ref.watch(modelsByBrandDatasource));
  });

final modelsByBrandUsecase = Provider((ref) {
    return GetModelsByBrandUsecaseImp(ref.watch(modelsByBrandRepository));
  });

final modelsNotifierProvider =
    StateNotifierProvider<ModelsNofier, List<ModelEntity>>(
  (ref) {
    return ModelsNofier(ref.watch(modelsByBrandUsecase));
  });
