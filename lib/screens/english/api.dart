import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'dart:async';

class http_service{

  

  Future<String> GetData (String value,int level) async{
    String uriWithPAram ="http://10.0.2.2:5000/GRAMMAR?Query="+value+"$level";

    print(uriWithPAram);
    var url=Uri.parse(uriWithPAram);
    http.Response Response = await http.get(url);
    var res = jsonDecode(Response.body);
    String finalRes = res['Query'];
    print( finalRes);
    return finalRes;
  }

}


