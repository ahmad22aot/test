import 'package:get/get.dart';
import 'package:store/model/itemModel.dart';

class ItemController extends GetxController {
  @override
  void onInit() {
    addItemToObject();
    super.onInit();
  }

  final isAdded = false.obs;
  final isLoading = true.obs;
  final List<Map> listOfDitem = <Map>[
    {
      'name': "banaa",
      'title':
          "layer the fruit in a large, clear glass bowl in this order: pineapple, strawberries, kiwi fruit, bananas, oranges, grapes, and blueberries. Pour the cooled sauce ",
      'image': "assets/2.jpg",
      'price': "200",
      'id': 13343,
      'quantity': 1,
    },
    {
      'name': "xxbanaa",
      'title':
          "ayer the fruit in a large, clear glass bowl in this order: pineapple, strawberries, kiwi fruit, bananas, oranges, grapes, and blueberries. Pour the cooled sauce ",
      'image': "assets/4.jpg",
      'price': "300",
      'id': 233443,
      'quantity': 1,
    },
    {
      'name': "avgjfnh",
      'title':
          "ayer the fruit in a large, clear glass bowl in this order: pineapple, strawberries, kiwi fruit, bananas, oranges, grapes, and blueberries. Pour the cooled sauce ",
      'image': "assets/5.jpg",
      'price': "400",
      'id': 44445,
      'quantity': 1,
    },
    {
      'name': "ebaneetsntaa",
      'title':
          "ayer the fruit in a large, clear glass bowl in this order: pineapple, strawberries, kiwi fruit, bananas, oranges, grapes, and blueberries. Pour the cooled sauce ",
      'image': "assets/3.jpg",
      'price': "500",
      'id': 55555,
      'quantity': 1,
    },
  ].obs;
  List<ItemModel> listOfOitem = <ItemModel>[].obs;

  void addItemToObject() {
    print("Start xxxxx");
    for (var item in listOfDitem) {
      listOfOitem.add(ItemModel(
        name: item['name'],
        title: item['title'],
        image: item['image'],
        id: item['id'],
        quantity: item['quantity'],
        price: item['price'],
      ));
    }
    //  isLoading.value = false;
  }

  changeQuantityAdd(ItemModel product) {
    var existing = listOfOitem.indexWhere((p) => p.id == product.id);

    if (existing != -1) {
      product.quantity = listOfOitem[existing].quantity + 1;
      listOfOitem[existing] = product;
      // instead of products[existing].quantity ++;
    } else {
      print('adding');
      listOfOitem.add(product);
    }
  }

  changeQuantityRemove(ItemModel product) {
    var existing = listOfOitem.indexWhere((p) => p.id == product.id);

    if (existing != -1) {
      product.quantity = listOfOitem[existing].quantity - 1;
      listOfOitem[existing] = product;
      // instead of products[existing].quantity ++;
    } else {
      print('adding');
      listOfOitem.add(product);
    }
  }

  void isAddedButton() {
    isAdded.value = !isAdded.value;
  }
/* 
  isAddedButton(ItemModel product) {
    var existing = listOfOitem.indexWhere((p) => p.id == product.id);

    if (existing != -1) {
      product.quantity = listOfOitem[existing].quantity + 1;
      listOfOitem[existing] = product;
      // instead of products[existing].quantity ++;
    } else {
      print('adding');
      listOfOitem.add(product);
    }
  } */

}
