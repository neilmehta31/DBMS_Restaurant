import 'dart:convert';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

var currUser;

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
        // "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json",
      });

      if (res.statusCode == 200) {
        // print(res.body.toString());
        // print('hey' + res.body.trim() + 'true');

        if (res.body.trim() == 'true') {
          currUser = username;
          print(currUser);
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
      // print(name + '<username and pass>' + password);
      final customerregister =
          Uri.parse('http://localhost:5000/signup/customer');

      var data = {
        'EMAIL': email,
        'PASSWORD': password,
        'CUSTOMER_NAME': name,
        'ADDRESS': address,
        'PHONE_NO': int.parse(phoneNo),
        'BILLING_AMT': 0,
        'PEOPLE_ACCOMPANYING': null,
        'ENTRYTIME': null,
        'BENCH_NUM': null,
        'EXITTIME': null
      };
      var body = jsonEncode(data);
      print(body);

      // Response res = await post(customerregister,
      //     headers: {
      //       "Access-Control-Allow-Origin": "*",
      //       "Access-Control-Allow-Credentials": "true",
      //       "Content-type": "application/json",
      //       "Accept": "application/json",
      //     },
      //     body: body);
      http.Response res =
          await http.post(customerregister, body: body, headers: {
        // "Access-Control-Allow-Origin": "http://localhost:5000",
        // "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json"
      });
      // print(jsonDecode(res.body).toString());
      // print(res.body.trim());

      if (res.statusCode == 200) {
        currUser = email;
        // print(res.body.toString());
        // print('hey' + res.body.trim() + 'true');
        return res.body.trim();
      } else {
        // print('false = ' + res.body.toString());
        return false;
      }
    } catch (err) {
      print('Caught error in ApiService.register(): $err');
    }
  }

  assignBench(int benchid) async {
    try {
      final assignBench = Uri.parse('http://localhost:5000/assignbench');
      var data = {'EMAIL': currUser, 'BENCH_NUM': benchid};
      var body = jsonEncode(data);
      var res = await http.post(assignBench, body: body, headers: {
        // "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json",
      });

      if (res.statusCode == 200) {
        // print(res.body.toString());
        // print('hey' + res.body.trim() + 'true');

        if (res.body.trim() == 'true') {
          print('so' + res.body.trim());
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

  getBench() async {
    final getBench = Uri.parse('http://localhost:5000/bench');
    http.Response res = await http.get(getBench);
    if (res.statusCode == 200) {
      print(res.body);
      return res.body.trim();
    } else {
      return jsonEncode({'result': 'Error'});
    }
  }

  getCurrUsr() {
    return currUser;
    // try {
    //   // getCurrUserDetails
    //   final userurl = Uri.parse('http://localhost:5000/getCurrUserDetails');
    //   var data = {'EMAIL': currUser};
    //   var body = jsonEncode(data);
    //   var res = await http.post(userurl, body: body, headers: {
    //     // "Access-Control-Allow-Origin": "*",
    //     // "Access-Control-Allow-Credentials": "true",
    //     "Content-type": "application/json",
    //     "Accept": "application/json",
    //   });
    //   if (res.statusCode == 200) {
    //     print(res.body);
    //     return res.body;
    //   } else {
    //     return false;
    //   }
    // } catch (err) {
    //   print('Caught error: $err');
    // }
  }

  getCurrUserDetails() async {
    try {
      // getCurrUserDetails
      final userurl = Uri.parse('http://localhost:5000/getCurrUserDetails');
      var data = {'EMAIL': currUser};
      var body = jsonEncode(data);
      var res = await http.post(userurl, body: body, headers: {
        // "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json",
      });
      if (res.statusCode == 200) {
        print(res.body.trim());
        return res.body.trim();
      } else {
        return false;
      }
    } catch (err) {
      print('Caught error: $err');
    }
  }

  getMealsData() async {
    try {
      final getMeals = Uri.parse('http://localhost:5000/menu');
      http.Response res = await http.get(getMeals);
      if (res.statusCode == 200) {
        print(res.body);
        return res.body.trim();
      } else {
        return jsonEncode({'result': 'Error'});
      }
    } catch (err) {
      print('Caught error: $err');
    }
  }

  takeOrder(String mealID) async {
    try {
      // getCurrUserDetails
      final userurl = Uri.parse('http://localhost:5000/takeorder');
      var data = {'EMAIL': currUser, 'MEAL_NAME': mealID};
      var body = jsonEncode(data);
      var res = await http.post(userurl, body: body, headers: {
        // "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Credentials": "true",
        "Content-type": "application/json",
        "Accept": "application/json",
      });
      if (res.statusCode == 200) {
        print(res.body.trim());
        return res.body.trim();
      } else {
        return false;
      }
    } catch (err) {
      print('Caught error: $err');
    }
  }
}
