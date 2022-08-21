import 'package:clean_fipe/domain/entities/fipe_info_entity.dart';
import 'package:clean_fipe/domain/repositories/get_fipe_info_repository.dart';

abstract class GetFipeInfoUsecase {
  Future<List<FipeInfoEntity>> getFipeInfo(
      String vehicleType, String brandCode, String modelCode, String yearCode);
}

class GetFipeInfoUsecaseImp implements GetFipeInfoUsecase {
  final GetFipeInfoRepository _repository;
  GetFipeInfoUsecaseImp(this._repository);

  @override
  Future<List<FipeInfoEntity>> getFipeInfo(String vehicleType, String brandCode,
      String modelCode, String yearCode) async {
    return await _repository.getFipeInfo(
        vehicleType, brandCode, modelCode, yearCode);
  }
}
