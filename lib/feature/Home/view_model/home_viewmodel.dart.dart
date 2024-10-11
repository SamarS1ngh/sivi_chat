import 'dart:convert';
import 'dart:developer';

import 'package:feature_based/data/remote/network/base_api_service.dart';
import 'package:feature_based/data/remote/network/network_api_service.dart';
import 'package:feature_based/feature/Home/model/history.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers.dart';
import '../../../data/local/local_storage.dart';
import '../../Chat/model/messages.dart';

class HomeViewModel extends StateNotifier<List<History>> {
  BaseApiService repo = NetworkApiService();
  HomeViewModel(this.ref) : super([]);
  final Ref ref;

  loadHistory() async {
    final jsonString =
        await LocalStorageService.getString(LocalStorageKeys.historyList);
    if (jsonString != null) {
      List<History> json = jsonDecode(jsonString)
          .map<History>((x) => History.fromJson(x))
          .toList();

      state = json;
    }
  }

  loadFirstHistory() {
    state = [
      History(
          dateTime: DateTime.now(), chatList: ref.read(chatProvider), id: 1),
      ...state
    ];
    saveHistory(state.first.chatList, state.first.id);
  }

  loadNewHistory() {
    state = [
      History(
          dateTime: DateTime.now(),
          chatList: ref.read(chatProvider),
          id: state.length + 1),
      ...state
    ];

    saveHistory(state.first.chatList, state.first.id);
  }

  saveHistory(List<Messages> messages, int threadID) async {
    final jsonString =
        await LocalStorageService.getString(LocalStorageKeys.historyList);
    if (jsonString == null) {
      state = [History(id: 1, dateTime: DateTime.now(), chatList: messages)];
      final json = jsonEncode(state);
      await LocalStorageService.setString(LocalStorageKeys.historyList, json);
    } else {
      state = jsonDecode(jsonString)
          .map<History>((x) => History.fromJson(x))
          .toList();
      state.removeWhere((element) => element.id == threadID);
      state = [
        History(
            id: state.length + 1, dateTime: DateTime.now(), chatList: messages),
        ...state,
      ];
      final json = jsonEncode(state);
      await LocalStorageService.setString(LocalStorageKeys.historyList, json);
    }
  }
}
