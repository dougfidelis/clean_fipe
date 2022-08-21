import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_fipe/domain/entities/fipe_info_entity.dart';
import 'package:clean_fipe/domain/usecases/get_fipe_info_usecase.dart';

class FipeInfoNotifier extends StateNotifier<List<FipeInfoEntity>> {
  final GetFipeInfoUsecase _usecase;
  FipeInfoNotifier(
    this._usecase,
  ) : super([]);

  Future<void> getFipeInfo(String vehicleType, String brandCode,
      String modelCode, String yearCode) async {
    state = [];
    state =
        await _usecase.getFipeInfo(vehicleType, brandCode, modelCode, yearCode);
  }
}
