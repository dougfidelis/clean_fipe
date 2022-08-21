import 'package:dio/dio.dart';

import '../../../domain/entities/fipe_info_entity.dart';
import '../../dtos/fipe_info_dto.dart';
import '../get_fipe_info_remote_datasource.dart';

class GetFipeInfoRemoteDatasourceImp implements GetFipeInfoRemoteDatasource {
  final Dio _dio;
  GetFipeInfoRemoteDatasourceImp(this._dio);

  @override
  Future<List<FipeInfoEntity>> getFipeInfo(String vehicleType, String brandCode,
      String modelCode, String yearCode) async {
    List<FipeInfoEntity> listInfo = [];
    FipeInfoEntity fipeInfo;

    final response = await _dio.get(
        'https://parallelum.com.br/fipe/api/v2/$vehicleType/brands/$brandCode/models/$modelCode/years/$yearCode');

    fipeInfo = FipeInfoDto(
        price: response.data['price'],
        brand: response.data['brand'],
        model: response.data['model'],
        modelYear: response.data['modelYear'],
        fuel: response.data['fuel'],
        codeFipe: response.data['codeFipe'],
        referenceMonth: response.data['referenceMonth'],
        vehicleType: response.data['vehicleType'],
        fuelAcronym: response.data['fuelAcronym']);

    listInfo.add(fipeInfo);

    return listInfo;
  }
}
