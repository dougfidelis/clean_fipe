import 'package:dio/dio.dart';

import '../../../domain/entities/fipe_info_entity.dart';
import '../../dtos/fipe_info_dto.dart';
import '../get_fipe_info_remote_datasource.dart';

class GetFipeInfoRemoteDatasourceImp implements GetFipeInfoRemoteDatasource {
  final Dio _dio;
  GetFipeInfoRemoteDatasourceImp(this._dio);

  @override
  Future<List<FipeInfoEntity>> getFipeInfo(
    String vehicleType,
    String brandCode,
    String modelCode,
    String yearCode,
  ) async {
    List<FipeInfoEntity> listInfo = [];

    final response = await _dio.get(
      'https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$brandCode/models/$modelCode/years/$yearCode',
    );

    listInfo.add(FipeInfoDto.fromMap(response.data));

    return listInfo;
  }
}
