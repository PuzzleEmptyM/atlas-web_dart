import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    String userData = await fetchUserData();
    
    Map<String, dynamic> userMap = jsonDecode(userData);
    
    return 'Hello ${userMap['username']}';
  } catch (error) {
    return 'error caught: $error';
  }
}

Future<String> loginUser() async {
  try {
    bool validUser = await checkCredentials();
    if (validUser) {
      print('There is a user: true');
      return await greetUser();
    } else {
      print('There is a user: false');
      return 'Wrong credentials';
    }
  } catch (error) {
    return 'error caught: $error';
  }
}
