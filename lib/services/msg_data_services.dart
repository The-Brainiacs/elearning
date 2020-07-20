import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ui/models/message_data.dart';
import './rest_service.dart';



class MsgDataService {


  static final MsgDataService _instance = MsgDataService._constructor();
  factory MsgDataService() {
    return _instance;
  }

  MsgDataService._constructor();
  final rest = RestService();

 static const String baseUrl =
             'http://localhost:5001/backend-elearning/us-central1/api';


  Future<List<Msg>> getAllMsgs() async {
    final listJson = await rest.get('msgs');

    return (listJson as List)
        .map((itemJson) => Msg.fromJson(itemJson))
        .toList();
  }

  
  Future deleteMsg({String id}) async {
    await rest.delete('msgs/$id');
  }

  Future<Msg> createMsg({Msg msg}) async {
    final json = await rest.post('msgs', data: msg);
    return Msg.fromJson(json);
  }


 Future get(String endpoint, {dynamic data}) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

Future<Msg> getMsgById({String id, String data}) async {
    final json = await rest.get('msgs/$id');
    return (json.data);
  }


} // class Msg
