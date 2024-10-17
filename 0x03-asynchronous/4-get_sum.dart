import '4-util.dart';
import 'dart:convert';

Future<dynamic> calculateTotal() async {
  try {
    var userData = await fetchUserData();
    var user = jsonDecode(userData);

    var userOrders = await fetchUserOrders(user['id']);
    var userOrdersList = jsonDecode(userOrders);

    double totalPrice = 0.00;
    for (var order in userOrdersList) {
      var price = await fetchProductPrice(order);
      var decodePrice = jsonDecode(price);
      totalPrice += decodePrice;
    }

    return totalPrice;
  } catch (err) {
    return -1;
  }
}
