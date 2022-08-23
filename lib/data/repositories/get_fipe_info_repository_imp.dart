import 'package:clean_fipe/domain/entities/fipe_info_entity.dart';

import '../../domain/repositories/get_fipe_info_repository.dart';
import '../datasources/get_fipe_info_remote_datasource.dart';

class GetFipeInfoRepositoryImp implements GetFipeInfoRepository {
  final GetFipeInfoRemoteDatasource _datasource;
  GetFipeInfoRepositoryImp(this._datasource);

  @override
  Future<FipeInfoEntity> getFipeInfo(String vehicleType, String brandCode,
      String modelCode, String yearCode) async {
    return await _datasource.getFipeInfo(
        vehicleType, brandCode, modelCode, yearCode);
  }
}
