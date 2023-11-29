// import 'dart:convert';
import 'package:http/http.dart' as http;

class Network{
  final String _url = 'http://192.168.102.83:8000/api';
  // var url = Uri.parse(_url);
  // 192.168.1.2 is my IP, change with your IP address

  getData(apiURL) async{
    var fullUrl = _url + apiURL;
    return await http.get(
      Uri.parse(fullUrl) ,

    );
  }
}