import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  //Login into customers dashboard
  apilogin(String username, String password) async {
    try {
      print(username + '<username and pass>' + password);
      final customerlogin = Uri.parse('http://localhost:5000/login/customer');
      var data = {'EMAIL': username, 'PASSWORD': password};
      var body = jsonEncode(data);
      print(body);
      var res = await http.post(customerlogin, body: body, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
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
}
