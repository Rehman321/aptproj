import 'dart:convert';

import 'package:aptproj/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataServices{
  String baseurl ="http://mark.bslmeiyu,com/api";
  Future <List<DataModel>> getinfo() async {
    var apiurl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseurl+apiurl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromjson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }

  }
}