import 'package:practice_list_view/domain/models/item.dart';

class ItemRepository {
  static List<Item> chestContent = [
    Item(icon: 'assets/images/apple.png', name: 'Apple', status: '+5 health'),
    Item(icon: 'assets/images/ruby.png', name: 'Ruby', status: '200 gold'),
    Item(
        icon: 'assets/images/shield.png',
        name: 'Wooden shield',
        status: '15 defense'),
    Item(
        icon: 'assets/images/sword.png',
        name: 'Magic Sword',
        status: '30 damage')
  ];
}
