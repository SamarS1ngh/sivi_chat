import 'dart:io';

class APINetworkConstants {
  static const baseURL = "http://localhost:3000/";

  static const Map<String, String> headers = {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json"
  };
}
