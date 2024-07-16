import 'package:practice_list_view/data/api/data_api.dart';
import 'package:practice_list_view/domain/models/equipment_model.dart';
import 'package:practice_list_view/domain/use_case/api_use_case.dart';

class ApiController implements ApiUseCase {
  final DataApi dataApi = DataApi();

  @override
  Future<List<EquipmentModel>> getAllEquipment() {
    return dataApi.getAllEquipments();
  }
}
