import 'dart:developer';

import 'package:feature_based/core/utils/app_colors.dart';
import 'package:feature_based/core/widgets/app_text.dart';
import 'package:feature_based/data/local/local_storage_service.dart';
import 'package:feature_based/feature/Home/model/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(homeProvider.notifier).loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    // LocalStorageService.clearAll();
    return Scaffold(
      appBar: AppBar(title: const Text('Conversation Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (ref.watch(homeProvider).isEmpty) {
            ref.read(homeProvider.notifier).loadFirstHistory();
          } else {
            ref.watch(homeProvider.notifier).loadNewHistory();
          }
          context.go('/chat', extra: ref.read(homeProvider).last);
        },
        child: const Icon(Icons.message),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ref.watch(homeProvider).isEmpty
                ? GestureDetector(
                    onTap: () {
                      ref.read(homeProvider.notifier).loadFirstHistory();
                      context.go('/chat', extra: ref.read(homeProvider)[0]);
                    },
                    child: Text(
                      "Tap to start a conversation",
                      style: TextStyle(color: AppColorsTheme.dark().bgInput),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: ref.watch(homeProvider).length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: Colors.grey.shade800,
                              onTap: () {
                                context.go('/chat',
                                    extra: ref.read(homeProvider)[index]);
                              },
                              leading: Container(
                                alignment: Alignment.center,
                                height: size.height * 0.04,
                                width: size.width * 0.08,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColorsTheme.dark().bgInput,
                                  image: DecorationImage(
                                    image: Image.asset(
                                      "assets/bot.png",
                                      fit: BoxFit.cover,
                                    ).image,
                                  ),
                                ),
                              ),
                              title: AppText.defaultTextBold("Bot",
                                  context: context),
                              subtitle: AppText.subtitleDefault(
                                  color: Colors.grey.shade300,
                                  "${ref.read(homeProvider).last.chatList.last.message} $index\n${ref.read(homeProvider)[index].dateTime.toLocal().toIso8601String()}",
                                  context: context),
                            ),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }
}
