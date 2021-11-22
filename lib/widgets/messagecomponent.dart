import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class MessageComponent extends StatelessWidget {
  const MessageComponent({Key? key, this.msg}) : super(key: key);
  final Message? msg;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var date = msg!.createAt!.toDate().toLocal();
    return Row(
      mainAxisAlignment:
          msg!.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Stack(
          children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: msg!.isMe ? Colors.lightBlue: Colors.grey.withOpacity(.9),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft: msg!.isMe
                    ? const Radius.circular(10)
                    : const Radius.circular(0),
                bottomRight: msg!.isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(10),
              )),
          constraints: BoxConstraints(
              minWidth: 30, minHeight: 40, maxWidth: width / 1.1),
          child: Text(
            msg!.content!,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 3,
          child: Container(
            padding: const EdgeInsetsDirectional.only(bottom: 5,),
            child: Text(
                  '${date.hour}h${date.minute}',
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
          ))
          ],
        )
      ],
    );
  }
}
