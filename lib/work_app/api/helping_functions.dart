import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Functions {
  static sendJson({
    required Map<String, dynamic>? jsonMap,
    required String url,
    required String method, // 'GET' or 'POST'
  }) async {
    var jsonData;
    var response;
    var jsonError = {
      'DocType': 'Error',
      'DocDate': DateTime.now().toString(),
      'Message': 'Check Internet Connection & try again - Server Error!',
    };

    try {
      final uri = Uri.parse(url);

      if (kDebugMode) {
        print('Request Method: $method');
        print('Request URL: $uri');
        if (jsonMap != null) {
          print('Request Parameters: $jsonMap');
        }
      }

      // Prepare query parameters for GET request
      final queryParams = <String, String>{};
      jsonMap?.forEach((key, value) {
        if (value is List) {
          for (var i = 0; i < value.length; i++) {
            queryParams['$key[$i]'] = value[i].toString();
          }
        } else {
          queryParams[key] = value.toString();
        }
      });
      // Handle GET and POST methods
      if (method.toUpperCase() == 'GET') {
        final queryParams = <String, String>{};
        jsonMap?.forEach((key, value) {
          if (value is List) {
            for (var i = 0; i < value.length; i++) {
              queryParams['$key[$i]'] = value[i].toString(); // Indexed params
            }
          } else {
            queryParams[key] = value.toString();
          }
        });

        final uriWithParams = uri.replace(queryParameters: queryParams);
        response = await http.get(
          uriWithParams,
          headers: {'Content-Type': 'application/json'},
        );
      } else if (method.toUpperCase() == 'POST') {
        // For POST requests, send parameters in the body as JSON
        response = await http.post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonMap != null ? json.encode(jsonMap) : null,
        );
      } else {
        throw UnsupportedError('HTTP method $method is not supported.');
      }

      if (kDebugMode) {
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }

      if (response.statusCode == 200) {
        try {
          jsonData = json.decode(response.body);
        } on FormatException catch (e) {
          return jsonError["Message"] =
              "Invalid response format - ${e.message}";
        }
        return jsonData;
      } else {
        return jsonError["Message"] =
            "Server responded with status code ${response.statusCode}";
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: ${e.toString()}');
      }
      return jsonError["Message"] = "An error occurred: ${e.toString()}";
    }
  }

  static bool isEmail(String email) {
    return RegExp(
      r"^[a-z][a-z0-9]*(?:[._-][a-z0-9]+)*@[a-zA-Z0-9]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$",
    ).hasMatch(email);
  }

  static bool validatePassword(String value) {
    return RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    ).hasMatch(value);
  }

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
