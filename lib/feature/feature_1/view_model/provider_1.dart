import 'dart:developer';
import 'package:feature_based/data/remote/network/base_api_service.dart';
import 'package:feature_based/data/remote/network/network_api_service.dart';
import 'package:flutter/material.dart';

class Provider1 extends ChangeNotifier {
  BaseApiService repo = NetworkApiService();

  void doSomethingAfterGettingDataFromAPI() {
    //we are using the abstract class to get the function to call data from api, instead of calling the actual implementation of data fetching
    //this reduces the dependancy on actual implementation, so that if it changes in future
    //we don't need to change the provider code

    repo.getResponse('url');
    log('after u got the data, apply the actual business logic in this function');
  }
}


//now call this doSomethingAfterGettingDataFromAPI in view, using provider or observer