import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';


class Api {
      Api();



        Future<Map<String, dynamic>> handleRequest({
          required String method, 
          required Map<String, String> headers, 
          required String url, 
          required Map<String, dynamic> body}) async {
            // Check for internet connectivity
            var connectivityResult = await (Connectivity().checkConnectivity());
            if (connectivityResult == ConnectivityResult.none) {
              return { 'success': 'false', 'comment': 'No internet connection detected on this device, please turn on your data/internet service'};
            }

            dynamic response;

            try {
             if (method=='post') {
                 response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(body));
             } else {
                 response = await http.get(Uri.parse(url), headers: headers);
             }

            
                // Parse the server response
                final responseData = jsonDecode(response.body);
                if (responseData is Map<String, dynamic>) {
                  log(responseData.toString());
                  return responseData;
                } else {
                  return {'success': 'false', 'comment': 'Error: Unexpected server response', 'data': {}};
                }

              
            } catch (error) {
              log(error.toString());
              return {'success': 'false', 'comment': 'Error: $error', 'data': {}};
            }
      }



       Future createNewRequestToken() async {
              Map<String, String> headers = {
                  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2M2RiMzQyMjZlZTE2MWRlZGMxOTYyNTAxOWRkNzRiZiIsInN1YiI6IjY1MWQ5Njc5NWIxMjQwMDExZDdjZGE1NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.J9ig-MqVOhsf9gQAoNkLhxcxnvkwfTxQ8RBV1Zt5FPk',
                  'accept': 'application/json', // Set your desired content type
              };
          
            const String url = 'https://api.themoviedb.org/3/authentication/token/new';
            final Map<String, String> body = {};

            return handleRequest(method:'get', headers: headers, url: url, body: body);
        }


      Future createSessionID() async {
           Map<String, String> headers = {
                  'Accept': 'application/json', // Set your desired content type
                  'content-type': 'application/json',
                  'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2M2RiMzQyMjZlZTE2MWRlZGMxOTYyNTAxOWRkNzRiZiIsInN1YiI6IjY1MWQ5Njc5NWIxMjQwMDExZDdjZGE1NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.J9ig-MqVOhsf9gQAoNkLhxcxnvkwfTxQ8RBV1Zt5FPk',
              };
            const String url = 'https://api.themoviedb.org/3/authentication/session/new';
            final Map<String, String> body = {};

            return handleRequest(method:'post', headers: headers, url: url, body: body);
        }
  
}