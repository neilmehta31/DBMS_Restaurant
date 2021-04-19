import 'dart:convert';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //Login into customers dashboard
  apilogin(String username, String password) async {
    try {
      // print(username + '<username and pass>' + password);
      final customerlogin = Uri.parse('http://localhost:5000/login/customer');
      var data = {'EMAIL': username, 'PASSWORD': password};
      var body = jsonEncode(data);
      print(body);
      var res = await http.post(customerlogin, body: body, headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json",
      });

      if (res.statusCode == 200) {
        // print(res.body.toString());
        // print('hey' + res.body.trim() + 'true');

        if (res.body.trim() == 'true') {
          // print('so');
          return res.body.trim();
        }
        return res.body.trim();
      } else {
        // print('false = ' + res.body.toString());
        return false;
      }
    } catch (err) {
      print('Caught error: $err');
    }
  }

  register(String name, String email, String password, String address,
      String phoneNo) async {
    try {
      // print(username + '<username and pass>' + password);
      final customerregister =
          Uri.parse('http://localhost:5000/register/customer');

      var data = {
        'EMAIL': email,
        'PASSWORD': password,
        'CUSTOMER_NAME': name,
        'ADDRESS': address,
        'PHONE_NO': phoneNo,
        'BILLING_AMT': 0,
        'PEOPLE_ACCOMPANYING': 1,
        'TIMESTAMP': null,
        'BENCH_NUM': null
      };
      var body = jsonEncode(data);
      print(body);
      var res = await http.post(customerregister, body: body, headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json",
      });

      if (res.statusCode == 200) {
        // print(res.body.toString());
        // print('hey' + res.body.trim() + 'true');
        return res.body.trim();
      } else {
        // print('false = ' + res.body.toString());
        return false;
      }
    } catch (err) {
      print('Caught error: $err');
    }
  }
}
