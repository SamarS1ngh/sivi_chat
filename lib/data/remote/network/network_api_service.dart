import 'dart:io';
import 'package:dio/dio.dart';
import '../api_exception.dart';
import 'base_api_service.dart';
import 'network_module.dart';

class NetworkApiService implements BaseApiService {
  final Dio dio = NetworkModule().dio;
  //Overides the getResponse method from BaseApiService
  @override
  Future<dynamic> getResponse(String url,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    dynamic responseJson;
    try {
      //makes get request with optional params
      final response = await dio.get(url,
          queryParameters: params, options: Options(headers: header));
      //Raises error if there is a bad status code
      //Raises error if there is a bad status code
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //Overides the postResponse method from BaseApiService
  @override
  Future<dynamic> postResponse(String url, dynamic jsonBody,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    dynamic responseJson;
    try {
      final response = await dio.post(url,
          //makes get request with optional params
          queryParameters: params,
          data: jsonBody,
          options: Options(headers: header));
      //Raises error if there is a bad status code
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //Overides the patchResponse method from BaseApiService
  @override
  Future<dynamic> patchResponse(String url, dynamic jsonBody,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    dynamic responseJson;
    try {
      final response = await dio.patch(url,
          //makes get request with optional params
          queryParameters: params,
          data: jsonBody,
          options: Options(headers: header));
      //Raises error if there is a bad status code
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //Overides the deleteResponse method from BaseApiService
  @override
  Future<dynamic> deleteResponse(String url,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    dynamic responseJson;
    try {
      final response = await dio.delete(url,
          //makes get request with optional params
          queryParameters: params,
          options: Options(headers: header));
      //Raises error if there is a bad status code
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //Overides the putResponse method from BaseApiService
  @override
  Future<dynamic> putResponse(String url, dynamic jsonBody,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    dynamic responseJson;
    try {
      final response = await dio.put(url,
          //makes get request with optional params
          queryParameters: params,
          options: Options(headers: header),
          data: jsonBody);

      //Raises error if there is a bad status code
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //Overides the postMultiPartResponse method from BaseApiService
  @override
  Future<dynamic> postMultiPartResponse(String url, FormData formData,
      {Map<String, String>? header, Map<String, dynamic>? params}) async {
    dynamic responseJson;
    try {
      final response = await dio.post(url,
          //makes get request with optional params
          queryParameters: params,
          data: formData,
          options: Options(headers: header));
      //Raises error if there is a bad status code
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    dynamic responseJson = response.data;
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['message']);
      case 401:
      case 403:
        throw UnauthorisedException(responseJson['message']);
      case 404:
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(responseJson['message']);
    }
  }
}
