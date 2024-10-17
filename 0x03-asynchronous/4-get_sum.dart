import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    String userData = await fetchUserData();
    Map<String, dynamic> userMap = jsonDecode(userData);
    String userId = userMap['id'];

    String ordersData = await fetchUserOrders(userId);
    List<dynamic> orders = jsonDecode(ordersData);

    double totalPrice = 0.0;

    for (var product in orders) {
      String priceData = await fetchProductPrice(product);
      var productPrice = jsonDecode(priceData);

      totalPrice += (productPrice is int) ? productPrice.toDouble() : productPrice;
    }

    return totalPrice;
  } catch (error) {
    return -1.0;
  }
}
