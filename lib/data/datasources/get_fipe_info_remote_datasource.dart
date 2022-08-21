import '../../domain/entities/fipe_info_entity.dart';

abstract class GetFipeInfoRemoteDatasource {
  Future<List<FipeInfoEntity>> getFipeInfo(
      String vehicleType, String brandCode, String modelCode, String yearCode);
}
