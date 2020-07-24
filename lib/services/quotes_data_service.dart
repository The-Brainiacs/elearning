import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ui/models/quote_model.dart';
import './rest_service.dart';



class QuoteDataService {
  //------- Here is how we implement 'Singleton pattern' in Dart --------

  static final QuoteDataService _instance = QuoteDataService._constructor();
  factory QuoteDataService() {
    return _instance;
  }

  QuoteDataService._constructor();
  final rest = RestService();
  //---------------------------- end of singleton implementation

  // Tho REST calls below, 1) to get all quotes and 2). to delete a quote
  //  are given for examples to guide you writing the other REST calls.
 static const String baseUrl =
       'https://us-central1-salsabila-exercise4.cloudfunctions.net/api';


  Future<List<Quote>> getAllQuotes() async {
    final listJson = await rest.get('quotes');

    return (listJson as List)
        .map((itemJson) => Quote.fromJson(itemJson))
        .toList();
  }

  // You may not need this REST call in your app. It is only for example here.
  Future deleteQuote({String id}) async {
    await rest.delete('quotes/$id');
  }

  // You may not need this REST call in your app. It is only for example here.
  Future<Quote> createQuote({Quote quote}) async {
    final json = await rest.post('quotes', data: quote);
    return Quote.fromJson(json);
  }

 Future get(String endpoint, {dynamic data}) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

Future<Quote> getQuoteById({String id, String data}) async {
    final json = await rest.get('quotes/$id');
    return (json.data);
  }

  //        Update a quote for a given id

  Future<Quote> updateQuote({String id, String data}) async {
    final json = await rest.patch('quotes/$id', data: {'data': data});
    return Quote.fromJson(json);
  }

  //        Vote a quote for like or dislike
  

  
  //        Like or dislike a quote

  Future<Quote> updateLike({String id, int like}) async {
    final json = await rest.patch('quotes/$id', data: {'like' : like});
    return Quote.fromJson(json);
  }

     Future<Quote> updateDislike({String id, int dislike}) async {
    final json = await rest.patch('quotes/$id', data: {'dislike' : dislike});
    return Quote.fromJson(json);
  }



} // class Quote
