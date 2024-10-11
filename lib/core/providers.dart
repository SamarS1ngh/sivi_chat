import 'package:feature_based/feature/Chat/model/messages.dart';
import 'package:feature_based/feature/Chat/view_model/chat_viewmodel.dart';
import 'package:feature_based/feature/Home/model/history.dart';
import 'package:feature_based/feature/Home/view_model/home_viewmodel.dart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider =
    StateNotifierProvider<ChatViewmodel, List<Messages>>((ref) {
  return ChatViewmodel(ref);
});

final homeProvider = StateNotifierProvider<HomeViewModel, List<History>>(
    (ref) => HomeViewModel(ref));
