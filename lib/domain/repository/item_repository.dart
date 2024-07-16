import 'package:practice_list_view/domain/models/item.dart';

class ItemRepository {
  static List<Item> chestContent = [
    Item(icon: 'images/apple.png', name: 'Apple', status: '+5 health'),
    Item(icon: 'images/ruby.png', name: 'Ruby', status: '200 gold'),
    Item(
        icon: 'images/shield.png', name: 'Wooden shield', status: '15 defense'),
    Item(icon: 'images/sword.png', name: 'Magic Sword', status: '30 damage')
  ];
}
