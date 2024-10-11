import 'dart:developer';

import 'package:feature_based/core/providers.dart';
import 'package:feature_based/core/utils/app_colors.dart';
import 'package:feature_based/feature/Chat/view/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../Home/model/history.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.history});
  final History history;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _isListening = false;
  String _recognizedText = '';
  @override
  void initState() {
    super.initState();
    ref.read(chatProvider.notifier).fetchConvo(widget.history.id);
    _initSpeechToText();
  }

  Future<void> _initSpeechToText() async {
    bool hasSpeechRecognition = await _speechToText.initialize(
      onStatus: (status) => log('Status: $status'),
      // onResult: (value) => _onSpeechResult(value),
      onError: (error) => log('Error: $error'),
    );
    if (hasSpeechRecognition) {
      setState(() => _isListening = true);
    } else {
      log('Speech recognition not supported');
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _recognizedText = result.recognizedWords;
    });
  }

  void _startListening() {
    _speechToText.listen(localeId: 'en_US');
    setState(() => _isListening = true);
  }

  void _stopListening() {
    _speechToText.stop();
    setState(() => _isListening = false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Screen')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.history.chatList.length,
              itemBuilder: (context, index) {
                final message = widget.history.chatList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    if (message.sender == "bot")
                      Row(
                        children: [
                          Container(
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
                          MessageBubble(
                            isMe: false,
                            text: message.message,
                          ),
                        ],
                      ),
                    if (message.sender == "human")
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MessageBubble(
                              isMe: true,
                              text: message.message,
                            ),
                            Container(
                                height: size.height * 0.04,
                                width: size.width * 0.08,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: const Icon(Icons.person))
                          ],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Container(
            color: Colors.black,
            width: size.width,
            height: size.height * 0.07,
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.06,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColorsTheme.dark().bgInput,
                      ),
                      child: IconButton(
                          onPressed: () {
                            _isListening ? _stopListening : _startListening;
                          },
                          icon: const Icon(Icons.mic, color: Colors.white)),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: size.width * 0.025),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: ref
                              .watch(chatProvider.notifier)
                              .messageController,
                          decoration: const InputDecoration(
                              hintText: 'Type your message',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              isDense: true),
                        )),
                  )),
                  InkWell(
                      onTap: () {
                        ref.read(chatProvider.notifier).sendMessage(
                            ref
                                .read(chatProvider.notifier)
                                .messageController
                                .text,
                            widget.history.id);

                        ref
                            .read(chatProvider.notifier)
                            .messageController
                            .clear();
                      },
                      child: Icon(
                        Icons.send,
                        color: AppColorsTheme.dark().bgInput,
                        size: 25,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
