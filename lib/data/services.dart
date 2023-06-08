import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;
abstract class Coupinos{
  Future<ContactPerson> getcontDetails();
}

class CoupinosLogin extends Coupinos {


  @override
  Future<ContactPerson> getcontDetails() async {
    final response = await http.post(Uri.parse('https://coupinos-app.azurewebsites.net/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': 'learntest43+1@gmail.com',
        'password': 'Test@123',
      }),
    );
    var data1 = jsonDecode(response.body);
    print(data1['contactPerson']);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      ContactPerson contDetails = ContactPerson.fromJson(data['contactPerson']);
      return contDetails;
    } else {
      throw Exception('Failed');
    }
  }
}