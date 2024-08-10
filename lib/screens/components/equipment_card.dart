import 'package:flutter/material.dart';
import 'package:practice_list_view/domain/models/equipment_model.dart';
import 'package:practice_list_view/utils/consts/colors.dart';
import 'package:practice_list_view/utils/theme.dart';

class EquipmentWidget extends StatelessWidget {
  const EquipmentWidget({required this.model, super.key});
  final EquipmentModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mainColor,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: SizedBox(
                  height: 240,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: NetworkImage(model.image),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          model.name.toUpperCase(),
                          style: EntryDecoration.titleText,
                        ),
                      ),
                      Flexible(
                          child: Text(
                        model.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      )),
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                const Text('Attack'),
                                Text(
                                  '${model.properties.attack ?? '-'}',
                                  style: const TextStyle(
                                    fontFamily: 'Philosopher',
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                const Text('Defense'),
                                Text('${model.properties.defense ?? '-'}',
                                    style: const TextStyle(
                                      fontFamily: 'Philosopher',
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
