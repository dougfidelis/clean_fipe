import 'package:clean_fipe/domain/entities/fipe_info_entity.dart';

abstract class GetFipeInfoRepository {
  Future<FipeInfoEntity> getFipeInfo(
      String vehicleType, String brandCode, String modelCode, String yearCode);
}
