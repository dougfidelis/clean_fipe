import 'package:clean_fipe/data/datasources/remote/get_brands_by_vehicle_type_remote_datasource_imp.dart';
import 'package:clean_fipe/data/repositories/get_brands_by_vehicle_type_repository_imp.dart';
import 'package:clean_fipe/domain/usecases/get_brands_by_vehicle_type_usecase.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/brand_entity.dart';
import 'brands_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final brandsDataSourceProvider = Provider((ref) {
  return GetBrandsByVehicleTypeRemoteDatasourceImp(ref.watch(dioProvider));
});

final brandsRepositoryProvider = Provider((ref) {
  return GetBrandsByVehicleTypeRepositoryImp(
      ref.watch(brandsDataSourceProvider));
});

final brandsUseCaseProvider = Provider((ref) {
  return GetBrandsByVehicleTypeUsecaseImp(ref.watch(brandsRepositoryProvider));
});

final brandsNotifierProvider =
    StateNotifierProvider<BrandsNotifier, List<BrandEntity>>((ref) {
  return BrandsNotifier(ref.watch(brandsUseCaseProvider));
});
