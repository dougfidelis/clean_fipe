import 'package:dio/dio.dart';

import '../../../domain/entities/fipe_info_entity.dart';
import '../../dtos/fipe_info_dto.dart';
import '../get_fipe_info_remote_datasource.dart';

class GetFipeInfoRemoteDatasourceImp implements GetFipeInfoRemoteDatasource {
  final Dio _dio;
  GetFipeInfoRemoteDatasourceImp(this._dio);

  @override
  Future<FipeInfoEntity> getFipeInfo(
    String vehicleType,
    String brandCode,
    String modelCode,
    String yearCode,
  ) async {
   
      final response = await _dio.get(
        'https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$brandCode/models/$modelCode/years/$yearCode',
      );

      return FipeInfoDto.fromMap(response.data);
    
  }
}
