// ignore_for_file: avoid_print

import 'package:chat_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final bool _writeTextPresent = true;

  get _sendText => null;

  get _voiceTake => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 32,
                color: const Color(0xFF087949).withOpacity(0.08),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                const SizedBox(width: kDefaultPadding),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            print('Clicked Emoji');
                            if (mounted) {
                              setState(() {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                              });
                            }
                          },
                        ),
                        const SizedBox(width: kDefaultPadding / 50),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Ecrire un message...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.attach_file,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.80),
                        ),
                        const SizedBox(width: kDefaultPadding / 4),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.80),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: GestureDetector(
                            child: _writeTextPresent
                                ? const Icon(
                                    Icons.send,
                                    color: Colors.green,
                                    size: 30.0,
                                  )
                                : const Icon(
                                    Icons.keyboard_voice_rounded,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                            onTap: _writeTextPresent ? _sendText : _voiceTake,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
