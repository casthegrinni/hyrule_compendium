import 'package:flutter/material.dart';
import 'package:practice_list_view/domain/repository/item_repository.dart';

class ChestPage extends StatelessWidget {
  const ChestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final content = ItemRepository.chestContent;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade800,
        title: const Text(
          'You found a chest!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.orangeAccent[100],
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(content[index].icon),
              title: Text(content[index].name),
              trailing: Text(content[index].status),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (content, index) => const Divider(
                color: Colors.brown,
              ),
          itemCount: content.length),
    );
  }
}
