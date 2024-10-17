import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    print('Fetching user data...');
    String userData = await fetchUserData();
    Map<String, dynamic> userMap = jsonDecode(userData);
    String userId = userMap['id'];
    print('User ID: $userId');

    print('Fetching user orders...');
    String ordersData = await fetchUserOrders(userId);
    List<dynamic> orders = jsonDecode(ordersData);
    print('User Orders: $orders');

    double totalPrice = 0.0;

    for (var product in orders) {
      print('Fetching price for product: $product');
      String priceData = await fetchProductPrice(product);
      var productPrice = jsonDecode(priceData);

      totalPrice += (productPrice is int) ? productPrice.toDouble() : productPrice;
      print('Price for $product: $productPrice');
    }

    print('Total Price: $totalPrice');
    return totalPrice;
  } catch (error) {
    print('Error caught: $error');
    return -1;
  }
}
