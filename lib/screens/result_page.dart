import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice_list_view/controllers/api_controller.dart';
import 'package:practice_list_view/screens/components/equipment_card.dart';
import 'package:practice_list_view/utils/theme.dart';

const Color containerColor = Color(0xFF4AD89E);
const Color mainColor = Color(0xFFF3ECD4);
const Color secondColor = Color(0xFFE1F7F6);

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'You found a large chest!'.toUpperCase(),
          style: EntryDecoration.titleText,
        ),
      ),
      backgroundColor: mainColor,
      body: FutureBuilder(
        future: apiController.getAllEquipment(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              break;

            case ConnectionState.none:
              break;

            case ConnectionState.done:
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    if (kDebugMode) {
                      print(
                          'name: ${snapshot.data![index].name}, image: ${snapshot.data![index].image}');
                    }
                    return EquipmentWidget(
                      model: snapshot.data![index],
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              }

            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
          }
          return Container();
        },
      ),
    );
  }
}
