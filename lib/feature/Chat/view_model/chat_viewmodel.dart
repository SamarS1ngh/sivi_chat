import 'dart:convert';
import 'dart:developer';
import 'package:feature_based/data/local/local_storage.dart';
import 'package:feature_based/data/remote/network/api_endpoints.dart';
import 'package:feature_based/data/remote/network/api_network_constants.dart';
import 'package:feature_based/data/remote/network/base_api_service.dart';
import 'package:feature_based/data/remote/network/network_api_service.dart';
import 'package:feature_based/feature/Chat/model/messages.dart';
import 'package:feature_based/feature/Chat/model/restaurant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../Home/model/history.dart';

class ChatViewmodel extends StateNotifier<List<Messages>> {
  ChatViewmodel(this.ref) : super([]);

  final Ref ref;
  BaseApiService repo = NetworkApiService();
  List<RestaurantElement> restaurantElement = [];
  TextEditingController messageController = TextEditingController();

  fetchConvo(int threadID) async {
    var response = await repo
        .getResponse(APINetworkConstants.baseURL + ApiEndPoints.dummyAPI);
    restaurantElement = Restaurant.fromJson(response).restaurant;
    final json =
        await LocalStorageService.getString(LocalStorageKeys.historyList);
    if (json == null) {
      ref.read(homeProvider.notifier).loadFirstHistory();
    } else {
      List<History> list =
          jsonDecode(json).map<History>((x) => History.fromJson(x)).toList();

      for (int i = 0; i < list.length; i++) {
        if (list[i].id == threadID) {
          state = list[i].chatList;
          break;
        }
      }

      if (state.isEmpty) {
        log('chl rha h??');
        String sender = "bot";
        String message = restaurantElement[0].bot;
        state = [(Messages(message: message, sender: sender))];
        ref.read(homeProvider.notifier).saveHistory(state, threadID);
      }
    }

    ref.read(homeProvider.notifier).saveHistory(state, threadID);
  }

  sendMessage(String message, int threadID) {
    state = [
      ...state,
      Messages(message: message, sender: "human"),
    ];
    ref.read(homeProvider.notifier).saveHistory(state, threadID);
  }
}
