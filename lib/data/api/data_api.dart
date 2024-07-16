import 'package:dio/dio.dart';
import 'package:practice_list_view/domain/models/equipment_model.dart';
import 'package:practice_list_view/utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();
  List<EquipmentModel> equipment = [];

  Future<List<EquipmentModel>> getAllEquipments() async {
    final response = await dio.get(urlEquipment);
    if (response.statusCode == 200) {
      equipment = List<EquipmentModel>.from(
          response.data['data'].map((e) => EquipmentModel.fromJson(e)));
    }
    return equipment;
  }
}
